# zlib
export LDFLAGS="$LDFLAGS -L/usr/local/opt/zlib/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/zlib/include"

export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# bzip2
export PATH="/usr/local/opt/bzip2/bin:$PATH"

export LDFLAGS="$LDFLAGS -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/bzip2/include"

# Flutter
export PATH="$PATH:$HOME/.flutter/bin"
export CHROME_EXECUTABLE=/Applications/Microsoft\ Edge.app/Contents/MacOS/Microsoft\ Edge

# LuaJIT
export PATH="/usr/local/opt/luajit-openresty/bin:$PATH"

export LDFLAGS="$LDFLAGS -L/usr/local/opt/luajit-openresty/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/luajit-openresty/include"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export LDFLAGS="$LDFLAGS -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/icu4c/include"

export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
