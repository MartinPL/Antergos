#!/usr/bin/perl -w

package KeyboardNames;

%models = (
    'A4Tech KB-21' => 'a4techKB21',
    'A4Tech KBS-8' => 'a4techKBS8',
    'A4Tech Wireless Desktop RFKB-23' => 'a4_rfkb23',
    'Acer AirKey V' => 'airkey',
    'Acer C300' => 'acer_c300',
    'Acer Ferrari 4000' => 'acer_ferrari4k',
    'Acer Laptop' => 'acer_laptop',
    'Advance Scorpius KI' => 'scorpius',
    'Amiga' => 'amiga',
    'Apple' => 'apple',
    'Apple Aluminium Keyboard (ANSI)' => 'applealu_ansi',
    'Apple Aluminium Keyboard (ISO)' => 'applealu_iso',
    'Apple Aluminium Keyboard (JIS)' => 'applealu_jis',
    'Apple Laptop' => 'apple_laptop',
    'Asus Laptop' => 'asus_laptop',
    'Atari TT' => 'ataritt',
    'Azona RF2300 wireless Internet Keyboard' => 'azonaRF2300',
    'BTC 5090' => 'btc5090',
    'BTC 5113RF Multimedia' => 'btc5113rf',
    'BTC 5126T' => 'btc5126t',
    'BTC 6301URF' => 'btc6301urf',
    'BTC 9000' => 'btc9000',
    'BTC 9000A' => 'btc9000a',
    'BTC 9001AH' => 'btc9001ah',
    'BTC 9019U' => 'btc9019u',
    'BTC 9116U Mini Wireless Internet and Gaming' => 'btc9116u',
    'BenQ X-Touch' => 'benqx',
    'BenQ X-Touch 730' => 'benqx730',
    'BenQ X-Touch 800' => 'benqx800',
    'Brother Internet Keyboard' => 'brother',
    'Cherry B.UNLIMITED' => 'cherrybunlim',
    'Cherry Blue Line CyBo@rd' => 'cherryblue',
    'Cherry Blue Line CyBo@rd (alternate option)' => 'cherrybluea',
    'Cherry CyBo@rd USB-Hub' => 'cherrycyboard',
    'Cherry CyMotion Expert' => 'cherrycmexpert',
    'Cherry CyMotion Master Linux' => 'cymotionlinux',
    'Cherry CyMotion Master XPress' => 'cherryblueb',
    'Chicony Internet Keyboard' => 'chicony',
    'Chicony KB-9885' => 'chicony9885',
    'Chicony KU-0108' => 'chicony0108',
    'Chicony KU-0420' => 'chicony0420',
    'Classmate PC' => 'classmate',
    'Compaq Easy Access Keyboard' => 'compaqeak8',
    'Compaq Internet Keyboard (13 keys)' => 'compaqik13',
    'Compaq Internet Keyboard (18 keys)' => 'compaqik18',
    'Compaq Internet Keyboard (7 keys)' => 'compaqik7',
    'Compaq iPaq Keyboard' => 'ipaq',
    'Creative Desktop Wireless 7000' => 'creativedw7000',
    'DTK2000' => 'dtk2000',
    'Dell' => 'dell',
    'Dell 101-key PC' => 'dell101',
    'Dell Laptop/notebook Inspiron 6xxx/8xxx' => 'inspiron',
    'Dell Laptop/notebook Precision M series' => 'precision_m',
    'Dell Latitude series laptop' => 'latitude',
    'Dell Precision M65' => 'dellm65',
    'Dell SK-8125' => 'dellsk8125',
    'Dell SK-8135' => 'dellsk8135',
    'Dell USB Multimedia Keyboard' => 'dellusbmm',
    'Dexxa Wireless Desktop Keyboard' => 'dexxa',
    'Diamond 9801 / 9802 series' => 'diamond',
    'Ennyah DKB-1008' => 'ennyah_dkb1008',
    'Everex STEPnote' => 'everex',
    'FL90' => 'compalfl90',
    'Fujitsu-Siemens Computers AMILO laptop' => 'fscaa1667g',
    'Generic 101-key PC' => 'pc101',
    'Generic 102-key (Intl) PC' => 'pc102',
    'Generic 104-key PC' => 'pc104',
    'Generic 105-key (Intl) PC' => 'pc105',
    'Genius Comfy KB-12e' => 'geniuscomfy',
    'Genius Comfy KB-16M / Genius MM Keyboard KWD-910' => 'genius',
    'Genius Comfy KB-21e-Scroll' => 'geniuscomfy2',
    'Genius KB-19e NB' => 'geniuskb19e',
    'Genius KKB-2050HS' => 'geniuskkb2050hs',
    'Gyration' => 'gyration',
    'HTC Dream' => 'htcdream',
    'Happy Hacking Keyboard' => 'hhk',
    'Happy Hacking Keyboard for Mac' => 'macintosh_hhk',
    'Hewlett-Packard Internet Keyboard' => 'hpi6',
    'Hewlett-Packard Mini 110 Notebook' => 'hpmini110',
    'Hewlett-Packard Omnibook 500 FA' => 'hp500fa',
    'Hewlett-Packard Omnibook 5xx' => 'hp5xx',
    'Hewlett-Packard Omnibook 6000/6100' => 'hp6000',
    'Hewlett-Packard Omnibook XE3 GC' => 'hpxe3gc',
    'Hewlett-Packard Omnibook XE3 GF' => 'hpxe3gf',
    'Hewlett-Packard Omnibook XT1000' => 'hpxt1000',
    'Hewlett-Packard Pavilion ZT11xx' => 'hpzt11xx',
    'Hewlett-Packard Pavilion dv5' => 'hpdv5',
    'Hewlett-Packard SK-250x Multimedia Keyboard' => 'hp250x',
    'Hewlett-Packard nx9020' => 'hpnx9020',
    'Honeywell Euroboard' => 'honeywell_euroboard',
    'Htc Dream phone' => 'htcdream',
    'IBM Rapid Access' => 'rapidaccess',
    'IBM Rapid Access II' => 'rapidaccess2',
    'IBM Space Saver' => 'ibm_spacesaver',
    'IBM ThinkPad 560Z/600/600E/A22E' => 'thinkpad',
    'IBM ThinkPad R60/T60/R61/T61' => 'thinkpad60',
    'IBM ThinkPad Z60m/Z60t/Z61m/Z61t' => 'thinkpadz60',
    'Keytronic FlexPro' => 'flexpro',
    'Kinesis' => 'kinesis',
    'Laptop/notebook Compaq (eg. Armada) Laptop Keyboard' => 'armada',
    'Laptop/notebook Compaq (eg. Presario) Internet Keyboard' => 'presario',
    'Laptop/notebook eMachines m68xx' => 'emachines',
    'Logitech Access Keyboard' => 'logiaccess',
    'Logitech Cordless Desktop' => 'logicd',
    'Logitech Cordless Desktop (alternate option)' => 'logicda',
    'Logitech Cordless Desktop EX110' => 'logiex110',
    'Logitech Cordless Desktop LX-300' => 'logiclx300',
    'Logitech Cordless Desktop Navigator' => 'logicdn',
    'Logitech Cordless Desktop Optical' => 'logicd_opt',
    'Logitech Cordless Desktop Pro (alternate option 2)' => 'logicdpa2',
    'Logitech Cordless Desktop iTouch' => 'logicd_it',
    'Logitech Cordless Freedom/Desktop Navigator' => 'logicfn',
    'Logitech G15 extra keys via G15daemon' => 'logitech_g15',
    'Logitech Generic Keyboard' => 'logitech_base',
    'Logitech Internet 350 Keyboard' => 'logii350',
    'Logitech Internet Keyboard' => 'logiik',
    'Logitech Internet Navigator Keyboard' => 'logicink',
    'Logitech Media Elite Keyboard' => 'logimel',
    'Logitech Ultra-X Cordless Media Desktop Keyboard' => 'logiultraxc',
    'Logitech Ultra-X Keyboard' => 'logiultrax',
    'Logitech diNovo Edge Keyboard' => 'logidinovoedge',
    'Logitech diNovo Keyboard' => 'logidinovo',
    'Logitech iTouch' => 'itouch',
    'Logitech iTouch Cordless Keyboard (model Y-RB6)' => 'logiitc',
    'Logitech iTouch Internet Navigator Keyboard SE' => 'logiinkse',
    'Logitech iTouch Internet Navigator Keyboard SE (USB)' => 'logiinkseusb',
    'MacBook/MacBook Pro' => 'macbook78',
    'MacBook/MacBook Pro (Intl)' => 'macbook79',
    'Macintosh' => 'macintosh',
    'Macintosh Old' => 'macintosh_old',
    'Memorex MX1998' => 'mx1998',
    'Memorex MX2500 EZ-Access Keyboard' => 'mx2500',
    'Memorex MX2750' => 'mx2750',
    'Microsoft Comfort Curve Keyboard 2000' => 'microsoftccurve2k',
    'Microsoft Internet Keyboard' => 'microsoftinet',
    'Microsoft Internet Keyboard Pro, Swedish' => 'microsoftprose',
    'Microsoft Natural' => 'microsoft',
    'Microsoft Natural Keyboard Elite' => 'microsoftelite',
    'Microsoft Natural Keyboard Pro / Microsoft Internet Keyboard Pro' => 'microsoftpro',
    'Microsoft Natural Keyboard Pro OEM' => 'microsoftprooem',
    'Microsoft Natural Keyboard Pro USB / Microsoft Internet Keyboard Pro' => 'microsoftprousb',
    'Microsoft Natural Wireless Ergonomic Keyboard 7000' => 'microsoft7000',
    'Microsoft Office Keyboard' => 'microsoftoffice',
    'Microsoft Wireless Multimedia Keyboard 1.0A' => 'microsoftmult',
    'Northgate OmniKey 101' => 'omnikey101',
    'OLPC' => 'olpc',
    'Ortek MCK-800 MM/Internet keyboard' => 'oretec',
    'PC-98xx Series' => 'pc98',
    'Propeller Voyager (KTEZ-1000)' => 'propeller',
    'QTronix Scorpius 98N+' => 'qtronix',
    'SILVERCREST Multimedia Wireless Keyboard' => 'silvercrest',
    'SK-1300' => 'sk1300',
    'SK-2500' => 'sk2500',
    'SK-6200' => 'sk6200',
    'SK-7100' => 'sk7100',
    'SVEN Ergonomic 2500' => 'sven',
    'SVEN Slim 303' => 'sven303',
    'Samsung SDM 4500P' => 'samsung4500',
    'Samsung SDM 4510P' => 'samsung4510',
    'Sanwa Supply SKB-KG3' => 'sanwaskbkg3',
    'Sun Type 4' => 'sun4',
    'Sun Type 5' => 'sun5',
    'Sun Type 5/6' => 'sun6',
    'Super Power Multimedia Keyboard' => 'sp_inet',
    'Symplon PaceBook (tablet PC)' => 'symplon',
    'Targa Visionary 811' => 'targa_v811',
    'Toshiba Satellite S3000' => 'toshiba_s3000',
    'Trust Direct Access Keyboard' => 'trustda',
    'Trust Slimline' => 'trust_slimline',
    'Trust Wireless Keyboard Classic' => 'trust',
    'TypeMatrix EZ-Reach 2020' => 'tm2020',
    'TypeMatrix EZ-Reach 2030 PS2' => 'tm2030PS2',
    'TypeMatrix EZ-Reach 2030 USB' => 'tm2030USB',
    'TypeMatrix EZ-Reach 2030 USB (102/105:EU mode)' => 'tm2030USB-102',
    'TypeMatrix EZ-Reach 2030 USB (106:JP mode)' => 'tm2030USB-106',
    'Unitek KB-1925' => 'unitekkb1925',
    'ViewSonic KU-306 Internet Keyboard' => 'vsonku306',
    'Winbook Model XP5' => 'winbook',
    'Yahoo! Internet Keyboard' => 'yahoo',
);

%layouts = (
    'Afghanistan' => 'af',
    'Albania' => 'al',
    'Andorra' => 'ad',
    'Arabic' => 'ara',
    'Armenia' => 'am',
    'Austria' => 'at',
    'Azerbaijan' => 'az',
    'Bangladesh' => 'bd',
    'Belarus' => 'by',
    'Belgium' => 'be',
    'Bhutan' => 'bt',
    'Bosnia and Herzegovina' => 'ba',
    'Botswana' => 'bw',
    'Braille' => 'brai',
    'Brazil' => 'br',
    'Bulgaria' => 'bg',
    'Cambodia' => 'kh',
    'Canada' => 'ca',
    'China' => 'cn',
    'Congo, Democratic Republic of the' => 'cd',
    'Croatia' => 'hr',
    'Czechia' => 'cz',
    'Denmark' => 'dk',
    'Esperanto' => 'epo',
    'Estonia' => 'ee',
    'Ethiopia' => 'et',
    'Faroe Islands' => 'fo',
    'Finland' => 'fi',
    'France' => 'fr',
    'Georgia' => 'ge',
    'Germany' => 'de',
    'Ghana' => 'gh',
    'Greece' => 'gr',
    'Guinea' => 'gn',
    'Hungary' => 'hu',
    'Iceland' => 'is',
    'India' => 'in',
    'Iran' => 'ir',
    'Iraq' => 'iq',
    'Ireland' => 'ie',
    'Israel' => 'il',
    'Italy' => 'it',
    'Japan' => 'jp',
    'Japan (PC-98xx Series)' => 'nec_vndr/jp',
    'Kazakhstan' => 'kz',
    'Kenya' => 'ke',
    'Korea, Republic of' => 'kr',
    'Kyrgyzstan' => 'kg',
    'Laos' => 'la',
    'Latin American' => 'latam',
    'Latvia' => 'lv',
    'Lithuania' => 'lt',
    'Macedonia' => 'mk',
    'Maldives' => 'mv',
    'Mali' => 'ml',
    'Malta' => 'mt',
    'Maori' => 'mao',
    'Mongolia' => 'mn',
    'Montenegro' => 'me',
    'Morocco' => 'ma',
    'Myanmar' => 'mm',
    'Nepal' => 'np',
    'Netherlands' => 'nl',
    'Nigeria' => 'ng',
    'Norway' => 'no',
    'Pakistan' => 'pk',
    'Philippines' => 'ph',
    'Poland' => 'pl',
    'Portugal' => 'pt',
    'Romania' => 'ro',
    'Russia' => 'ru',
    'Senegal' => 'sn',
    'Serbia' => 'rs',
    'Slovakia' => 'sk',
    'Slovenia' => 'si',
    'South Africa' => 'za',
    'Spain' => 'es',
    'Sri Lanka' => 'lk',
    'Sweden' => 'se',
    'Switzerland' => 'ch',
    'Syria' => 'sy',
    'Tajikistan' => 'tj',
    'Tanzania' => 'tz',
    'Thailand' => 'th',
    'Turkey' => 'tr',
    'Turkmenistan' => 'tm',
    'USA' => 'us',
    'Ukraine' => 'ua',
    'United Kingdom' => 'gb',
    'Uzbekistan' => 'uz',
    'Vietnam' => 'vn',
);

%variants = (
    'af' => {
	'OLPC Dari' => 'olpc-fa',
	'OLPC Pashto' => 'olpc-ps',
	'OLPC Southern Uzbek' => 'olpc-uz',
	'Pashto' => 'ps',
	'Southern Uzbek' => 'uz',
    },
    'am' => {
	'Alternative Eastern' => 'eastern-alt',
	'Alternative Phonetic' => 'phonetic-alt',
	'Eastern' => 'eastern',
	'Phonetic' => 'phonetic',
	'Western' => 'western',
    },
    'ara' => {
	'Buckwalter' => 'buckwalter',
	'azerty' => 'azerty',
	'azerty/digits' => 'azerty_digits',
	'digits' => 'digits',
	'qwerty' => 'qwerty',
	'qwerty/digits' => 'qwerty_digits',
    },
    'at' => {
	'Eliminate dead keys' => 'nodeadkeys',
	'Macintosh' => 'mac',
	'Sun dead keys' => 'sundeadkeys',
    },
    'az' => {
	'Cyrillic' => 'cyrillic',
    },
    'ba' => {
	'US keyboard with Bosnian digraphs' => 'unicodeus',
	'US keyboard with Bosnian letters' => 'us',
	'Use Bosnian digraphs' => 'unicode',
	'Use guillemets for quotes' => 'alternatequotes',
    },
    'bd' => {
	'Probhat' => 'probhat',
    },
    'be' => {
	'Alternative' => 'oss',
	'Alternative, Sun dead keys' => 'oss_sundeadkeys',
	'Alternative, latin-9 only' => 'oss_latin9',
	'Eliminate dead keys' => 'nodeadkeys',
	'ISO Alternate' => 'iso-alternate',
	'Sun dead keys' => 'sundeadkeys',
	'Wang model 724 azerty' => 'wang',
    },
    'bg' => {
	'New phonetic' => 'bas_phonetic',
	'Traditional phonetic' => 'phonetic',
    },
    'br' => {
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Nativo' => 'nativo',
	'Nativo for Esperanto' => 'nativo-epo',
	'Nativo for USA keyboards' => 'nativo-us',
    },
    'brai' => {
	'Left hand' => 'left_hand',
	'Right hand' => 'right_hand',
    },
    'by' => {
	'Latin' => 'latin',
	'Legacy' => 'legacy',
    },
    'ca' => {
	'English' => 'eng',
	'French (legacy)' => 'fr-legacy',
	'French Dvorak' => 'fr-dvorak',
	'Inuktitut' => 'ike',
	'Ktunaxa' => 'kut',
	'Multilingual' => 'multix',
	'Multilingual, first part' => 'multi',
	'Multilingual, second part' => 'multi-2gr',
	'Secwepemctsin' => 'shs',
    },
    'ch' => {
	'French' => 'fr',
	'French (Macintosh)' => 'fr_mac',
	'French, Sun dead keys' => 'fr_sundeadkeys',
	'French, eliminate dead keys' => 'fr_nodeadkeys',
	'German (Macintosh)' => 'de_mac',
	'German, Sun dead keys' => 'de_sundeadkeys',
	'German, eliminate dead keys' => 'de_nodeadkeys',
	'Legacy' => 'legacy',
    },
    'cn' => {
	'Tibetan' => 'tib',
	'Tibetan (with ASCII numerals)' => 'tib_asciinum',
	'Uyghur' => 'uig',
    },
    'cz' => {
	'UCW layout (accented letters only)' => 'ucw',
	'US Dvorak with CZ UCW support' => 'dvorak-ucw',
	'With <\|> key' => 'bksl',
	'qwerty' => 'qwerty',
	'qwerty, extended Backslash' => 'qwerty_bksl',
    },
    'de' => {
	'Dead acute' => 'deadacute',
	'Dead grave acute' => 'deadgraveacute',
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Lower Sorbian' => 'dsb',
	'Lower Sorbian (qwertz)' => 'dsb_qwertz',
	'Macintosh' => 'mac',
	'Macintosh, eliminate dead keys' => 'mac_nodeadkeys',
	'Neo 2' => 'neo',
	'Romanian keyboard with German letters' => 'ro',
	'Romanian keyboard with German letters, eliminate dead keys' => 'ro_nodeadkeys',
	'Russian phonetic' => 'ru',
	'Sun dead keys' => 'sundeadkeys',
	'qwerty' => 'qwerty',
    },
    'dk' => {
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Macintosh' => 'mac',
	'Macintosh, eliminate dead keys' => 'mac_nodeadkeys',
    },
    'ee' => {
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'US keyboard with Estonian letters' => 'us',
    },
    'epo' => {
	'displaced semicolon and quote (obsolete)' => 'legacy',
    },
    'es' => {
	'Asturian variant with bottom-dot H and bottom-dot L' => 'ast',
	'Catalan variant with middle-dot L' => 'cat',
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Include dead tilde' => 'deadtilde',
	'Macintosh' => 'mac',
	'Sun dead keys' => 'sundeadkeys',
    },
    'fi' => {
	'Classic' => 'classic',
	'Classic, eliminate dead keys' => 'nodeadkeys',
	'Macintosh' => 'mac',
	'Northern Saami' => 'smi',
    },
    'fo' => {
	'Eliminate dead keys' => 'nodeadkeys',
    },
    'fr' => {
	'(Legacy) Alternative' => 'latin9',
	'(Legacy) Alternative, Sun dead keys' => 'latin9_sundeadkeys',
	'(Legacy) Alternative, eliminate dead keys' => 'latin9_nodeadkeys',
	'Alternative' => 'oss',
	'Alternative, Sun dead keys' => 'oss_sundeadkeys',
	'Alternative, eliminate dead keys' => 'oss_nodeadkeys',
	'Alternative, latin-9 only' => 'oss_latin9',
	'Bepo, ergonomic, Dvorak way' => 'bepo',
	'Bepo, ergonomic, Dvorak way, latin-9 only' => 'bepo_latin9',
	'Breton' => 'bre',
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Georgian AZERTY Tskapo' => 'geo',
	'Macintosh' => 'mac',
	'Occitan' => 'oci',
	'Sun dead keys' => 'sundeadkeys',
    },
    'gb' => {
	'Colemak' => 'colemak',
	'Dvorak' => 'dvorak',
	'Dvorak (UK Punctuation)' => 'dvorakukp',
	'Extended - Winkeys' => 'extd',
	'International (with dead keys)' => 'intl',
	'Macintosh' => 'mac',
	'Macintosh (International)' => 'mac_intl',
    },
    'ge' => {
	'Ergonomic' => 'ergonomic',
	'MESS' => 'mess',
	'Ossetian' => 'os',
	'Russian' => 'ru',
    },
    'gh' => {
	'Akan' => 'akan',
	'Avatime' => 'avn',
	'Ewe' => 'ewe',
	'Fula' => 'fula',
	'GILLBT' => 'gillbt',
	'Ga' => 'ga',
	'Hausa' => 'hausa',
	'Multilingual' => 'generic',
    },
    'gr' => {
	'Eliminate dead keys' => 'nodeadkeys',
	'Extended' => 'extended',
	'Polytonic' => 'polytonic',
	'Simple' => 'simple',
    },
    'hr' => {
	'US keyboard with Croatian digraphs' => 'unicodeus',
	'US keyboard with Croatian letters' => 'us',
	'Use Croatian digraphs' => 'unicode',
	'Use guillemets for quotes' => 'alternatequotes',
    },
    'hu' => {
	'101/qwerty/comma/Dead keys' => '101_qwerty_comma_dead',
	'101/qwerty/comma/Eliminate dead keys' => '101_qwerty_comma_nodead',
	'101/qwerty/dot/Dead keys' => '101_qwerty_dot_dead',
	'101/qwerty/dot/Eliminate dead keys' => '101_qwerty_dot_nodead',
	'101/qwertz/comma/Dead keys' => '101_qwertz_comma_dead',
	'101/qwertz/comma/Eliminate dead keys' => '101_qwertz_comma_nodead',
	'101/qwertz/dot/Dead keys' => '101_qwertz_dot_dead',
	'101/qwertz/dot/Eliminate dead keys' => '101_qwertz_dot_nodead',
	'102/qwerty/comma/Dead keys' => '102_qwerty_comma_dead',
	'102/qwerty/comma/Eliminate dead keys' => '102_qwerty_comma_nodead',
	'102/qwerty/dot/Dead keys' => '102_qwerty_dot_dead',
	'102/qwerty/dot/Eliminate dead keys' => '102_qwerty_dot_nodead',
	'102/qwertz/comma/Dead keys' => '102_qwertz_comma_dead',
	'102/qwertz/comma/Eliminate dead keys' => '102_qwertz_comma_nodead',
	'102/qwertz/dot/Dead keys' => '102_qwertz_dot_dead',
	'102/qwertz/dot/Eliminate dead keys' => '102_qwertz_dot_nodead',
	'Eliminate dead keys' => 'nodeadkeys',
	'Standard' => 'standard',
	'qwerty' => 'qwerty',
    },
    'ie' => {
	'CloGaelach' => 'CloGaelach',
	'Ogham' => 'ogam',
	'Ogham IS434' => 'ogam_is434',
	'UnicodeExpert' => 'UnicodeExpert',
    },
    'il' => {
	'Biblical Hebrew (Tiro)' => 'biblical',
	'Phonetic' => 'phonetic',
	'lyx' => 'lyx',
    },
    'in' => {
	'Bengali' => 'ben',
	'Bengali Probhat' => 'ben_probhat',
	'English with RupeeSign' => 'eng',
	'Gujarati' => 'guj',
	'Gurmukhi' => 'guru',
	'Gurmukhi Jhelum' => 'jhelum',
	'Hindi Bolnagri' => 'bolnagri',
	'Hindi Wx' => 'hin-wx',
	'Kannada' => 'kan',
	'Malayalam' => 'mal',
	'Malayalam Lalitha' => 'mal_lalitha',
	'Oriya' => 'ori',
	'Tamil' => 'tam',
	'Tamil Keyboard with Numerals' => 'tam_keyboard_with_numerals',
	'Tamil TAB Typewriter' => 'tam_TAB',
	'Tamil TSCII Typewriter' => 'tam_TSCII',
	'Tamil Unicode' => 'tam_unicode',
	'Telugu' => 'tel',
	'Urdu, Alternative phonetic' => 'urd-phonetic3',
	'Urdu, Phonetic' => 'urd-phonetic',
	'Urdu, Winkeys' => 'urd-winkeys',
    },
    'iq' => {
	'Kurdish, (F)' => 'ku_f',
	'Kurdish, Arabic-Latin' => 'ku_ara',
	'Kurdish, Latin Alt-Q' => 'ku_alt',
	'Kurdish, Latin Q' => 'ku',
    },
    'ir' => {
	'Kurdish, (F)' => 'ku_f',
	'Kurdish, Arabic-Latin' => 'ku_ara',
	'Kurdish, Latin Alt-Q' => 'ku_alt',
	'Kurdish, Latin Q' => 'ku',
	'Persian, with Persian Keypad' => 'pes_keypad',
    },
    'is' => {
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Macintosh' => 'mac',
	'Sun dead keys' => 'Sundeadkeys',
    },
    'it' => {
	'Eliminate dead keys' => 'nodeadkeys',
	'Georgian' => 'geo',
	'Macintosh' => 'mac',
	'US keyboard with Italian letters' => 'us',
    },
    'jp' => {
	'Kana' => 'kana',
	'Kana 86' => 'kana86',
	'Macintosh' => 'mac',
	'OADG 109A' => 'OADG109A',
    },
    'ke' => {
	'Kikuyu' => 'kik',
    },
    'kg' => {
	'Phonetic' => 'phonetic',
    },
    'kr' => {
	'101/104 key Compatible' => 'kr104',
    },
    'kz' => {
	'Kazakh with Russian' => 'kazrus',
	'Russian with Kazakh' => 'ruskaz',
    },
    'latam' => {
	'Eliminate dead keys' => 'nodeadkeys',
	'Include dead tilde' => 'deadtilde',
	'Sun dead keys' => 'sundeadkeys',
    },
    'lk' => {
	'Tamil TAB Typewriter' => 'tam_TAB',
	'Tamil Unicode' => 'tam_unicode',
    },
    'lt' => {
	'IBM (LST 1205-92)' => 'ibm',
	'LEKP' => 'lekp',
	'LEKPa' => 'lekpa',
	'Standard' => 'std',
	'US keyboard with Lithuanian letters' => 'us',
    },
    'lv' => {
	'Apostrophe () variant' => 'apostrophe',
	'F-letter (F) variant' => 'fkey',
	'Tilde (~) variant' => 'tilde',
    },
    'ma' => {
	'French' => 'french',
	'Tifinagh' => 'tifinagh',
	'Tifinagh alternative' => 'tifinagh-alt',
	'Tifinagh alternative phonetic' => 'tifinagh-alt-phonetic',
	'Tifinagh extended' => 'tifinagh-extended',
	'Tifinagh extended phonetic' => 'tifinagh-extended-phonetic',
	'Tifinagh phonetic' => 'tifinagh-phonetic',
    },
    'me' => {
	'Cyrillic' => 'cyrillic',
	'Cyrillic with guillemets' => 'cyrillicalternatequotes',
	'Cyrillic, Z and ZHE swapped' => 'cyrillicyz',
	'Latin qwerty' => 'latinyz',
	'Latin unicode' => 'latinunicode',
	'Latin unicode qwerty' => 'latinunicodeyz',
	'Latin with guillemets' => 'latinalternatequotes',
    },
    'mk' => {
	'Eliminate dead keys' => 'nodeadkeys',
    },
    'ml' => {
	'English (USA International)' => 'us-intl',
	'English (USA Macintosh)' => 'us-mac',
	'Fran??ais (France Alternative)' => 'fr-oss',
    },
    'mt' => {
	'Maltese keyboard with US layout' => 'us',
    },
    'ng' => {
	'Hausa' => 'hausa',
	'Igbo' => 'igbo',
	'Yoruba' => 'yoruba',
    },
    'nl' => {
	'Macintosh' => 'mac',
	'Standard' => 'std',
	'Sun dead keys' => 'sundeadkeys',
    },
    'no' => {
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Macintosh' => 'mac',
	'Macintosh, eliminate dead keys' => 'mac_nodeadkeys',
	'Northern Saami' => 'smi',
	'Northern Saami, eliminate dead keys' => 'smi_nodeadkeys',
    },
    'ph' => {
	'Capewell-Dvorak (Baybayin)' => 'capewell-dvorak-bay',
	'Capewell-Dvorak (Latin)' => 'capewell-dvorak',
	'Capewell-QWERF 2006 (Baybayin)' => 'capewell-qwerf2k6-bay',
	'Capewell-QWERF 2006 (Latin)' => 'capewell-qwerf2k6',
	'Colemak (Baybayin)' => 'colemak-bay',
	'Colemak (Latin)' => 'colemak',
	'Dvorak (Baybayin)' => 'dvorak-bay',
	'Dvorak (Latin)' => 'dvorak',
	'QWERTY (Baybayin)' => 'qwerty-bay',
    },
    'pk' => {
	'Arabic' => 'ara',
	'CRULP' => 'urd-crulp',
	'NLA' => 'urd-nla',
	'Sindhi' => 'snd',
    },
    'pl' => {
	'Dvorak' => 'dvorak',
	'Dvorak, Polish quotes on key 1' => 'dvorak_altquotes',
	'Dvorak, Polish quotes on quotemark key' => 'dvorak_quotes',
	'Kashubian' => 'csb',
	'Programmer Dvorak' => 'dvp',
	'Russian phonetic Dvorak' => 'ru_phonetic_dvorak',
	'qwertz' => 'qwertz',
    },
    'pt' => {
	'Eliminate dead keys' => 'nodeadkeys',
	'Macintosh' => 'mac',
	'Macintosh, Sun dead keys' => 'mac_sundeadkeys',
	'Macintosh, eliminate dead keys' => 'mac_nodeadkeys',
	'Nativo' => 'nativo',
	'Nativo for Esperanto' => 'nativo-epo',
	'Nativo for USA keyboards' => 'nativo-us',
	'Sun dead keys' => 'sundeadkeys',
    },
    'ro' => {
	'Cedilla' => 'cedilla',
	'Crimean Tatar (Dobruca-1 Q)' => 'crh_dobruca1',
	'Crimean Tatar (Dobruca-2 Q)' => 'crh_dobruca2',
	'Crimean Tatar (Turkish Alt-Q)' => 'crh_alt',
	'Crimean Tatar (Turkish F)' => 'crh_f',
	'Standard' => 'std',
	'Standard (Cedilla)' => 'std_cedilla',
	'Winkeys' => 'winkeys',
    },
    'rs' => {
	'Latin' => 'latin',
	'Latin Unicode' => 'latinunicode',
	'Latin Unicode qwerty' => 'latinunicodeyz',
	'Latin qwerty' => 'latinyz',
	'Latin with guillemets' => 'latinalternatequotes',
	'Pannonian Rusyn Homophonic' => 'rue',
	'With guillemets' => 'alternatequotes',
	'Z and ZHE swapped' => 'yz',
    },
    'ru' => {
	'Bashkirian' => 'bak',
	'Chuvash' => 'cv',
	'Chuvash Latin' => 'cv_latin',
	'DOS' => 'dos',
	'Kalmyk' => 'xal',
	'Komi' => 'kom',
	'Legacy' => 'legacy',
	'Mari' => 'chm',
	'Ossetian, Winkeys' => 'os_winkeys',
	'Ossetian, legacy' => 'os_legacy',
	'Phonetic' => 'phonetic',
	'Phonetic Winkeys' => 'phonetic_winkeys',
	'Serbian' => 'srp',
	'Tatar' => 'tt',
	'Typewriter' => 'typewriter',
	'Typewriter, legacy' => 'typewriter-legacy',
	'Udmurt' => 'udm',
	'Yakut' => 'sah',
    },
    'se' => {
	'Dvorak' => 'dvorak',
	'Eliminate dead keys' => 'nodeadkeys',
	'Macintosh' => 'mac',
	'Northern Saami' => 'smi',
	'Russian phonetic' => 'rus',
	'Russian phonetic, eliminate dead keys' => 'rus_nodeadkeys',
	'Svdvorak' => 'svdvorak',
    },
    'si' => {
	'US keyboard with Slovenian letters' => 'us',
	'Use guillemets for quotes' => 'alternatequotes',
    },
    'sk' => {
	'Extended Backslash' => 'bksl',
	'qwerty' => 'qwerty',
	'qwerty, extended Backslash' => 'qwerty_bksl',
    },
    'sy' => {
	'Kurdish, (F)' => 'ku_f',
	'Kurdish, Latin Alt-Q' => 'ku_alt',
	'Kurdish, Latin Q' => 'ku',
	'Syriac' => 'syc',
	'Syriac phonetic' => 'syc_phonetic',
    },
    'th' => {
	'Pattachote' => 'pat',
	'TIS-820.2538' => 'tis',
    },
    'tj' => {
	'Legacy' => 'legacy',
    },
    'tm' => {
	'Alt-Q' => 'alt',
    },
    'tr' => {
	'(F)' => 'f',
	'Alt-Q' => 'alt',
	'Crimean Tatar (Turkish Alt-Q)' => 'crh_alt',
	'Crimean Tatar (Turkish F)' => 'crh_f',
	'Crimean Tatar (Turkish Q)' => 'crh',
	'International (with dead keys)' => 'intl',
	'Kurdish, (F)' => 'ku_f',
	'Kurdish, Latin Alt-Q' => 'ku_alt',
	'Kurdish, Latin Q' => 'ku',
	'Sun dead keys' => 'sundeadkeys',
    },
    'ua' => {
	'Crimean Tatar (Turkish Alt-Q)' => 'crh_alt',
	'Crimean Tatar (Turkish F)' => 'crh_f',
	'Crimean Tatar (Turkish Q)' => 'crh',
	'Homophonic' => 'homophonic',
	'Legacy' => 'legacy',
	'Phonetic' => 'phonetic',
	'Standard RSTU' => 'rstu',
	'Standard RSTU on Russian layout' => 'rstu_ru',
	'Typewriter' => 'typewriter',
	'Winkeys' => 'winkeys',
    },
    'us' => {
	'Alternative international' => 'alt-intl',
	'Cherokee' => 'chr',
	'Classic Dvorak' => 'dvorak-classic',
	'Colemak' => 'colemak',
	'Dvorak' => 'dvorak',
	'Dvorak alternative international (no dead keys)' => 'dvorak-alt-intl',
	'Dvorak international (with dead keys)' => 'dvorak-intl',
	'International (AltGr dead keys)' => 'altgr-intl',
	'International (with dead keys)' => 'intl',
	'Layout toggle on multiply/divide key' => 'olpc2',
	'Left handed Dvorak' => 'dvorak-l',
	'Macintosh' => 'mac',
	'Programmer Dvorak' => 'dvp',
	'Right handed Dvorak' => 'dvorak-r',
	'Russian phonetic' => 'rus',
	'Serbo-Croatian' => 'hbs',
	'With EuroSign on 5' => 'euro',
    },
    'uz' => {
	'Crimean Tatar (Turkish Alt-Q)' => 'crh_alt',
	'Crimean Tatar (Turkish F)' => 'crh_f',
	'Crimean Tatar (Turkish Q)' => 'crh',
	'Latin' => 'latin',
    },
);

1;
