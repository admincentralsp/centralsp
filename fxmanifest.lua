fx_version 'adamant'
game 'gta5'
lua54 'yes'
author 'https://github.com/Krisuniooo'
description 'Radar Gun applied to 3D model with DUI'
version '1.0.0'
shared_scripts {
    '@vrp/lib/utils.lua'
}
client_scripts {
	'config.lua',
	'client/client.lua',
}
server_scripts {
    'server/server.lua',
}
ui_page 'ui/index.html'
files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js',
    'metas/*.meta',
}
data_file 'WEAPON_METADATA_FILE' 'metas/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'metas/weaponanimations.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'metas/contentunlocks.meta'
data_file 'PED_PERSONALITY_FILE' 'metas/pedpersonality.meta'
data_file 'WEAPONINFO_FILE' 'metas/weapons.meta'

