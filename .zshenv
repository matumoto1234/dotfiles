#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export EDITOR='vim'
export DENO_INSTALL="/home/matumoto/.deno"
export XDG_CONFIG_HOME="/home/matumoto/.config"
export PATH=/home/matumoto/.local/bin:$PATH
export PATH=$PATH:"/home/matumoto/.opam/default/bin"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export PNPM_HOME="/home/matumoto/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export CPLUS_INCLUDE_PATH="/home/matumoto/src/codes/ac-library"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  # setting private environments. e.g. token
  source "${ZDOTDIR:-$HOME}/.zshenv-private"

  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
. "$HOME/.cargo/env"
