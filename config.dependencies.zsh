# zlib
config_dependency zlib true

# bzip2
export PATH="/usr/local/opt/bzip2/bin:$PATH"

config_dependency bzip2

# LuaJIT
export PATH="/usr/local/opt/luajit-openresty/bin:$PATH"

config_dependency luajit-openresty

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

config_dependency icu4c
