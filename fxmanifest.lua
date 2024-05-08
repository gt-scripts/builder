fx_version 'cerulean'
game 'gta5'

name 'REPO_NAME' -- This can be set manually if you like, by default it will be the name of the repository
description 'Replace me with a cool description for your resource!'
author 'AUTHOR_NAME' -- This can be set manually if you like, by default it will be the name owner of the repository
version 'VERSION_IDENTIFIER' -- You should not change this, to keep version updated, change it on the version file.

lua54 'yes'

shared_scripts { }

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}
