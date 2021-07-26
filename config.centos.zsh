# Source global definitions
if [ -z "$C_INCLUDE_PATH" ]; then
    export C_INCLUDE_PATH=/usr/include
fi

if [ -z "$CPLUS_INCLUDE_PATH" ]; then
    export CPLUS_INCLUDE_PATH=/usr/include
fi

if [ -z "$CPATH" ]; then
    export CPATH=/usr/include
fi

if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH=/lib64:/lib
fi

if [ -f /opt/etc/bashrc ]; then
        . /opt/etc/bashrc
fi

if [ -d $HOME/nvim-linux64/bin ]; then
    export PATH=$PATH:$HOME/nvim-linux64/bin
fi

export TMPDIR=$HOME/.tmp

export PATH=$HOME/Repositories/config-tools/:$PATH
