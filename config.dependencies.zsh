# coreutils
# brew install coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# gnupg
export PATH="$(brew --prefix gnupg@2.2)/bin:$PATH"

# zlib
config_dependency zlib true

# bzip2
export PATH="$(brew --prefix bzip2)/bin:$PATH"

config_dependency bzip2

# LuaJIT
export PATH="$(brew --prefix luajit-openresty)/bin:$PATH"

config_dependency luajit-openresty

# icu4c
export PATH="$(brew --prefix icu4c)/bin:$PATH"
export PATH="$(brew --prefix icu4c)/sbin:$PATH"

config_dependency icu4c

# openblas
config_dependency openblas true

# openssl
export PATH="$(brew --prefix openssl)/bin:$PATH"

config_dependency openssl true

# readline
config_dependency readline true

# sqlite
export PATH="$(brew --prefix sqlite)/bin:$PATH"

config_dependency sqlite true
