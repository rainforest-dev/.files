# pyenv
export PYENV_ROOT="$(brew --prefix pyenv)"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then 
	eval "$(pyenv virtualenv-init -)"
fi

# protect your system python from
# polution from 3rd-party packages
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# commands to override pip restriction above.
# use `gpip` or `gpip3` to force installation of
# a package in the global python environment
# Never do this! It is just an escape hatch.
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
