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

if [ -d $HOME/node ]; then
    export PATH=$PATH:$HOME/node/bin
    alias node="$HOME/.node_modules/bin"
    alias npm="$HOME/node/bin/npm"
    alias npx="$HOME/node/bin/npx"
fi
# [FabioRosado | Fix worker_threads module missing | Fabio Rosado](https://fabiorosado.dev/blog/pyright-worker-threads-missing/)
export NODE_OPTIONS=--experimental-worker

if [ -d $HOME/nvim ]; then
    export PATH=$PATH:$HOME/nvim
fi

export TMPDIR=$HOME/.tmp
export TEMP=$TMPDIR # for Pytorch

export PATH=$HOME/Repositories/config-tools/:$PATH
