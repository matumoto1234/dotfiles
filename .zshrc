#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# prompt settings
fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit -u

autoload -Uz compinit && compinit

function left-prompt {
  name_t='179m%}'      # user name text clolr
  name_b='000m%}'    # user name background color
  path_t='255m%}'     # path text clolr
  path_b='031m%}'   # path background color
  arrow='087m%}'   # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'   # reset
  sharp='\uE0B0'      # triangle

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}⇒ ${reset}"
}

PROMPT=`left-prompt`


# コマンドの実行ごとに改行
function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
				echo ""
    fi
}

# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  branch='\ue0a0'
  color='%{\e[38;5;' #  文字色を設定
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset

  if [ ! -e  ".git" -a ! -e "../.git" -a ! -e "../../.git" -a ! -e "../../../.git" -a ! -e "../../../../.git" -a ! -e "../../../../../.git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'


# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh


# Use vifm and cd
vicd()
{
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}


# aliases
alias setz='source ~/.zshrc'
alias vpn='echo "UoA-202204\ns1280136\nmatumoto0208" | sudo openconnect --no-dtls --protocol=gp -c ~/src/cert/cert_ains-vpn-client-2022.p12 ains-vpn.u-aizu.ac.jp'
alias findstr='grep -lr'
alias g='g++ -O2 -Wall -Wextra -fsplit-stack -fstack-protector-all -ftrapv -fsanitize=undefined -D_GRIBCXX_DEBUG -Wfloat-equal -std=c++20 -I/home/matumoto/code_box/compro/library -o a.out'
alias a='./a.out'
alias gnome-screenshot='gnome-screenshot --interactive'
alias sudo='sudo '
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias i3lock='i3lock -i ~/Pictures/backgrounds/i3lock_backgrounds.png -c "#000000" -o "#191d0f" -w "#572020" -l "#ffffff" -e'

# trash-cli descriptions
# trash-put           trash files and directories.
# trash-empty         empty the trashcan(s).
# trash-list          list trashed files.
# trash-restore       restore a trashed file.
# trash-rm            remove individual files from the trashcan.

# opam configuration
[[ ! -r /home/matumoto/.opam/opam-init/init.zsh ]] || source /home/matumoto/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/matumoto/src/google-cloud-sdk/path.zsh.inc' ]; then . '/home/matumoto/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/matumoto/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/matumoto/src/google-cloud-sdk/completion.zsh.inc'; fi

# ghcup-env
[ -f "/home/matumoto/.ghcup/env" ] && source "/home/matumoto/.ghcup/env"
