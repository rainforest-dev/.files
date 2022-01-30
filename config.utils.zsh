function banner {
        figlet ${@:2} -f $HOME/.files/banner/3d.flf $1 | lolcat
}

function config_dependency {
        need_config_pkg=${2:-false}
        BASEDIR=$(brew --prefix $1)
        export LDFLAGS="-L$BASEDIR/lib $LDFLAGS"
        export CPPFLAGS="-I$BASEDIR/include $CPPFLAGS"
        if $need_config_pkg ; then export PKG_CONFIG_PATH="$BASEDIR/lib/pkgconfig"; fi
}

function timestamp {
        echo $(date +"%Y-%m-%d %T")
}
