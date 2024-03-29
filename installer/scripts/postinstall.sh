#!/usr/bin/bash
# -*- coding: utf-8 -*-
#
#  postinstall.sh
#
#  Copyright © 2013-2016 Antergos
#
#  This file is part of Cnchi.
#
#  Cnchi is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  Cnchi is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  The following additional terms are in effect as per Section 7 of the license:
#
#  The preservation of all legal notices and author attributions in
#  the material or in the Appropriate Legal Notices displayed
#  by works containing it is required.
#
#  You should have received a copy of the GNU General Public License
#  along with Cnchi; If not, see <http://www.gnu.org/licenses/>.

# Set xorg config files
set_xorg_touchpad() {
    cp /usr/share/cnchi/scripts/postinstall/50-synaptics.conf ${CN_DESTDIR}/etc/X11/xorg.conf.d/50-synaptics.conf
    cp /usr/share/cnchi/scripts/postinstall/99-killX.conf ${CN_DESTDIR}/etc/X11/xorg.conf.d/99-killX.conf

    # Fix sensitivity for chromebooks
    if lsmod | grep -q cyapa; then
        cp /usr/share/cnchi/scripts/postinstall/50-cros-touchpad.conf ${CN_DESTDIR}/etc/X11/xorg.conf.d/50-cros-touchpad.conf
    fi
}

set_gsettings() {
    # Set gsettings input-source
    CN_KEYBOARD=""
    CN_INPUT_SCHEMA="${CN_DESTDIR}/usr/share/glib-2.0/schemas/90_antergos.input-sources.gschema.override"
    if [[ "${CN_KEYBOARD_LAYOUT}" != '' ]]; then
        if [[ "${CN_KEYBOARD_VARIANT}" != '' ]]; then
            CN_KEYBOARD=${CN_KEYBOARD_LAYOUT}+${CN_KEYBOARD_VARIANT}
        else
            CN_KEYBOARD=${CN_KEYBOARD_LAYOUT}
        fi
        echo "[org.cinnamon.desktop.input-sources]" > ${CN_INPUT_SCHEMA}
        echo "sources=[('xkb','${CN_KEYBOARD}')]" >> ${CN_INPUT_SCHEMA}
        echo " " >> ${CN_INPUT_SCHEMA}
        echo "[org.gnome.desktop.input-sources]" >> ${CN_INPUT_SCHEMA}
        echo "sources=[('xkb','${CN_KEYBOARD}')]" >> ${CN_INPUT_SCHEMA}
    fi

    # Set default Internet browser
    for CN_SCHEMA_OVERRIDE in ${CN_DESTDIR}/usr/share/glib-2.0/schemas/90_antergos*; do
        if [ "${CN_BROWSER}" != "" ]; then
            sed -i "s|chromium|${CN_BROWSER}|g" "${CN_SCHEMA_OVERRIDE}"
        else
            sed -i "s|'chromium.desktop',||g" "${CN_SCHEMA_OVERRIDE}"
        fi
    done

    glib-compile-schemas "${CN_DESTDIR}/usr/share/glib-2.0/schemas"
}

set_dmrc() {
    # Set session in .dmrc
    echo "[Desktop]" > ${CN_DESTDIR}/home/${CN_USER_NAME}/.dmrc
    echo "Session=$1" >> ${CN_DESTDIR}/home/${CN_USER_NAME}/.dmrc
    chroot ${CN_DESTDIR} chown ${CN_USER_NAME}:users /home/${CN_USER_NAME}/.dmrc
}

set_lightdm() {
    # Workaround for LightDM bug https://bugs.launchpad.net/lightdm/+bug/1069218
    sed -i 's|UserAccounts|UserList|g' "${CN_DESTDIR}/etc/lightdm/users.conf"

    # Monkey patch session wrapper
    cp /usr/share/cnchi/scripts/postinstall/Xsession "${CN_DESTDIR}/etc/lightdm"
    chmod +x "${CN_DESTDIR}/etc/lightdm/Xsession"

    # Set lightdm-webkit2-greeter in lightdm.conf. This should have been done here (not in the pkg) all along.
    sed -i 's|#greeter-session=example-gtk-gnome|greeter-session=lightdm-webkit2-greeter|g' "${CN_DESTDIR}/etc/lightdm/lightdm.conf"

    # Start vbox client services if we are installed in vbox
    if [[ ${CN_IS_VBOX} = "True" ]] || { [[ $(systemd-detect-virt) ]] && [[ 'oracle' = $(systemd-detect-virt -v) ]]; }; then
        # TODO: This should be done differently
        sed -i 's|echo "X|/usr/bin/VBoxClient-all \&\necho "X|g' "${CN_DESTDIR}/etc/lightdm/Xsession"
    fi

    # copy antergos menu icon
    mkdir -p ${CN_DESTDIR}/usr/share/antergos/
    cp -t ${CN_DESTDIR}/usr/share/antergos \
    /usr/share/antergos/antergos-menu.png \
    /usr/share/cnchi/data/images/antergos/antergos-menu-logo-dark-bg.png
}

common_settings() {
    # Set skel directory (not needed, antergos-desktop-settings does this)
    #cp -R ${CN_DESTDIR}/home/${CN_USER_NAME}/.config ${CN_DESTDIR}/etc/skel

    # Set .bashrc (antergos-desktop-settings can't set it because it's already in bash package)
    if [[ -f "${CN_DESTDIR}/etc/skel/bashrc" ]]; then
        cp ${CN_DESTDIR}/etc/skel/bashrc ${CN_DESTDIR}/etc/skel/.bashrc
        cp ${CN_DESTDIR}/etc/skel/bashrc ${CN_DESTDIR}/home/${CN_USER_NAME}/.bashrc
    fi

    # Setup root defaults
    cp -R ${CN_DESTDIR}/etc/skel/. ${CN_DESTDIR}/root

    # Set antergos shell logo (used by gdm)
    cp /usr/share/antergos/logo.png ${CN_DESTDIR}/usr/share/antergos/
}

gnome_settings() {
    set_gsettings

    set_dmrc gnome
	chroot ${CN_DESTDIR} systemctl enable gdm
}

cinnamon_settings() {
    set_gsettings

    # Copy menu@cinnamon.org.json to set menu icon
    mkdir -p ${CN_DESTDIR}/home/${CN_USER_NAME}/.cinnamon/configs/menu@cinnamon.org/
    cp -f /usr/share/cnchi/scripts/postinstall/menu@cinnamon.org.json ${CN_DESTDIR}/home/${CN_USER_NAME}/.cinnamon/configs/menu@cinnamon.org/

    # Copy panel-launchers@cinnamon.org.json to set launchers
    PANEL_LAUNCHER="/usr/share/cnchi/scripts/postinstall/panel-launchers@cinnamon.org.json"
    if [[ firefox = "${CN_BROWSER}" ]]; then
        sed -i 's|chromium|firefox|g' ${PANEL_LAUNCHER}
    elif [ "${CN_BROWSER}" == "" ]; then
        sed -i 's|"chromium.desktop",||g' ${PANEL_LAUNCHER}
    fi

    mkdir -p ${CN_DESTDIR}/home/${CN_USER_NAME}/.cinnamon/configs/panel-launchers@cinnamon.org/
    cp -f /usr/share/cnchi/scripts/postinstall/panel-launchers@cinnamon.org.json ${CN_DESTDIR}/home/${CN_USER_NAME}/.cinnamon/configs/panel-launchers@cinnamon.org/

    set_dmrc cinnamon
	set_lightdm
}

xfce_settings() {
    set_gsettings

    # Set XFCE settings
    mkdir -p ${CN_DESTDIR}/home/${CN_USER_NAME}/.config/xfce4/xfconf/xfce-perchannel-xml
    cp -R ${CN_DESTDIR}/etc/xdg/xfce4/panel ${CN_DESTDIR}/etc/xdg/xfce4/helpers.rc ${CN_DESTDIR}/home/${CN_USER_NAME}/.config/xfce4

    HELPERS_RC="${CN_DESTDIR}/home/${CN_USER_NAME}/.config/xfce4/helpers.rc"
    if [[ ${CN_BROWSER} = "chromium" ]]; then
        sed -i "s/WebBrowser=firefox/WebBrowser=chromium/" ${HELPERS_RC}
    elif [ "${CN_BROWSER}" == "" ]; then
        sed -i "s/WebBrowser=firefox//" ${HELPERS_RC}
    fi

    set_dmrc xfce

    # Add lxpolkit to autostart apps
    cp /etc/xdg/autostart/lxpolkit.desktop ${CN_DESTDIR}/home/${CN_USER_NAME}/.config/autostart
    set_lightdm
}

openbox_settings() {
    set_gsettings

    set_dmrc openbox
    set_lightdm
}

kde_settings() {
    set_gsettings

    set_dmrc kde-plasma

    # Force QtCurve to use our theme
    rm -R ${CN_DESTDIR}/usr/share/kstyle/themes/qtcurve.themerc

    # Setup user defaults
    #if [ -f "${CN_DESTDIR}/usr/share/antergos-kde-setup/install.sh" ]; then
    #    chroot ${CN_DESTDIR} /usr/share/antergos-kde-setup/install.sh ${CN_USER_NAME}
    #elif [ -f "${CN_DESTDIR}/usr/share/antergos-desktop" ]; then
    #    chroot ${CN_DESTDIR} /usr/bin/antergos-desktop plasma ${CN_USER_NAME}
    #fi

    cp ${CN_DESTDIR}/etc/skel/.gtkrc-2.0-kde4 ${CN_DESTDIR}/root
    chroot ${CN_DESTDIR} "ln -s /root/.gtkrc-2.0-kde4 /root/.gtkrc-2.0"

    # Set default directories
    chroot ${CN_DESTDIR} su -c xdg-user-dirs-update ${CN_USER_NAME}
    set_lightdm
}

mate_settings() {
    set_gsettings

    set_dmrc mate

    # Set MintMenu Favorites
    APP_LIST="/usr/share/cnchi/scripts/postinstall/applications.list"
    if [[ "${CN_BROWSER}" = 'firefox' ]]; then
        sed -i 's|chromium|firefox|g' ${APP_LIST}
    elif [ "${CN_BROWSER}" == "" ]; then
        sed -i 's|location:/usr/share/applications/chromium.desktop||g' ${APP_LIST}
    fi

    cp ${APP_LIST} "${CN_DESTDIR}/usr/lib/linuxmint/mintMenu/applications.list"

    # Copy panel layout and make it the default
    cd "${CN_DESTDIR}/usr/share/mate-panel/layouts"
    cp /usr/share/cnchi/scripts/antergos.layout .
    rm default.layout
    ln -sr antergos.layout default.layout
    cd -

    # Work-around for bug in mate-panel
    CN_POST_INSTALL_DIR=/usr/share/cnchi/scripts/postinstall
    CN_HOTFIX_SCRIPT="${CN_POST_INSTALL_DIR}/first-boot-hotfix.sh"
    CN_HOTFIX_DESKTOP="${CN_POST_INSTALL_DIR}/first-boot-hotfix.desktop"
    cp "${CN_HOTFIX_SCRIPT}" "${CN_DESTDIR}/usr/bin"
    mkdir -p "${CN_DESTDIR}/home/${CN_USER_NAME}/.config/autostart"
    cp "${CN_HOTFIX_DESKTOP}" "${CN_DESTDIR}/home/${CN_USER_NAME}/.config/autostart"
    chmod +x "${CN_DESTDIR}/usr/bin/first-boot-hotfix.sh"

    set_lightdm
}

nox_settings() {
	set_lightdm
    echo "Done"
}

# Experimental DE's

lxqt_settings() {
    set_gsettings

    set_dmrc razor
	set_lightdm
}

enlightenment_settings() {
    set_gsettings

    # http://git.enlightenment.org/core/enlightenment.git/plain/data/tools/enlightenment_remote

    # Setup user defaults
    #chroot ${CN_DESTDIR} /usr/share/antergos-enlightenment-setup/install.sh ${CN_USER_NAME}
    #chroot ${CN_DESTDIR} /usr/bin/antergos-desktop enlightenment ${CN_USER_NAME}

    # Set Keyboard layout
    E_CFG="/home/${CN_USER_NAME}/.e/e/config/standard/e.cfg"
    E_SRC="/home/${CN_USER_NAME}/.e/e/config/standard/e.src"

    ${CN_DESTDIR}/usr/bin/eet -d ${E_CFG} config ${E_SRC}
    sed -i 's/"us"/"${CN_KEYBOARD_LAYOUT}"/' ${E_SRC}
    if [[ "${CN_KEYBOARD_VARIANT}" != '' ]]; then
        sed -i 's/"basic"/"${CN_KEYBOARD_VARIANT}"/' ${E_SRC}
    fi
    ${CN_DESTDIR}/usr/bin/eet -e ${E_CFG} config ${E_SRC} 1

    set_dmrc enlightenment

    # Add lxpolkit to autostart apps
    cp /etc/xdg/autostart/lxpolkit.desktop ${CN_DESTDIR}/home/${CN_USER_NAME}/.config/autostart
    set_lightdm
}

budgie_settings() {
    set_gsettings

    set_dmrc budgie
    set_lightdm
}

i3_settings() {
    set_gsettings

    set_dmrc i3
    set_lightdm
}

postinstall() {
    # Specific user configurations
    if [[ -f /usr/share/applications/firefox.desktop ]]; then
        export CN_BROWSER=firefox
    elif [[ -f /usr/share/applications/chromium.desktop ]]; then
        export CN_BROWSER=chromium
    else
        export CN_BROWSER=""
    fi

    ## Unmute alsa channels
    #chroot "${CN_DESTDIR}" amixer -c 0 -q set Master playback 50% unmute

    # Configure touchpad. Skip with base installs
    if [[ "base" != "${CN_DESKTOP}" ]]; then
        set_xorg_touchpad
    fi

    # Configure fontconfig
    FONTCONFIG_FILE="/usr/share/cnchi/scripts/fonts.conf"
    if [[ -f "${FONTCONFIG_FILE}" ]]; then
        FONTCONFIG_DIR="${CN_DESTDIR}/home/${CN_USER_NAME}/.config/fontconfig"
        mkdir -p "${FONTCONFIG_DIR}"
        cp "${FONTCONFIG_FILE}" "${FONTCONFIG_DIR}"
    fi

    # Set Antergos name in filesystem files
    cp /etc/arch-release "${CN_DESTDIR}/etc"
    cp /etc/os-release "${CN_DESTDIR}/etc"
    sed -i 's|Arch|Antergos|g' "${CN_DESTDIR}/etc/issue"

    # Set common desktop settigns
    common_settings

    # Set desktop-specific settings
    ${CN_DESKTOP}_settings

    # Set some environment vars
    env_files=("${CN_DESTDIR}/etc/environment"
        "${CN_DESTDIR}/home/${CN_USER_NAME}/.bashrc"
        "${CN_DESTDIR}/etc/skel/.bashrc"
        "${CN_DESTDIR}/etc/profile")

    for file in "${env_files[@]}"
    do
        echo "# >>> Added by cnchi installer" >> "${file}"
        if [ "${CN_BROWSER}" != "" ]; then
            echo "BROWSER=/usr/bin/${CN_BROWSER}" >> "${file}"
        fi
        echo "EDITOR=/usr/bin/nano" >> "${file}"
        # This is inside .bashrc.aliases from the antergos-desktop-settings package
        #echo "export QT_STYLE_OVERRIDE=gtk" >> "${file}"
        #echo "export QT_SELECT=qt5" >> "${file}"
    done

    # Configure makepkg so that it doesn't compress packages after building.
    # Most users are building packages to install them locally so there's no need for compression.
    sed -i "s|^PKGEXT='.pkg.tar.xz'|PKGEXT='.pkg.tar'|g" "${CN_DESTDIR}/etc/makepkg.conf"

    # Ensure user permissions are set in /home
    chroot "${CN_DESTDIR}" chown -R "${CN_USER_NAME}:users" "/home/${CN_USER_NAME}"
}

touch /tmp/.postinstall.lock
echo "Called installation script with these parameters: [$1] [$2] [$3] [$4] [$5] [$6] [$7]" > /var/log/cnchi/postinstall.log
CN_USER_NAME=$1
CN_DESTDIR=$2
CN_DESKTOP=$3
CN_LOCALE=$4
CN_IS_VBOX=$5
CN_KEYBOARD_LAYOUT=$6
CN_KEYBOARD_VARIANT=$7

# Use this to test this script (remember to mount /install manually before testing)
#chroot_setup "${CN_DESTDIR}"

{ postinstall; } >> /var/log/cnchi/postinstall.log 2>&1
rm /tmp/.postinstall.lock
