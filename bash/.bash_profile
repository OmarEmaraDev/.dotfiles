source ~/.bashrc

# Environmental Variables.
export CC=clang
export CXX=clang++
export MAKEFLAGS="-j$(nproc)"
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
export LSAN_OPTIONS="print_suppressions=false:suppressions=/home/omar/.config/lsan/suppressions"
