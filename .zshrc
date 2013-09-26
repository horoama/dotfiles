export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

bindkey -e               # キーバインドをemacsモードに設定
#bindkey -v              # キーバインドをviモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
#バージョン管理システムのロード
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"


#prompt
#PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
PROMPT="[%n@%F{yellow}%m%F{reset}]%F{cyan}%~ %F{reset}#"
##zshプロンプトにモード表示
#function zle-line-init zle-keymap-select {
#    case $KEYMAP in
#	vicmd)
#	PROMPT="%{$fg[red]%}[%{$reset_color%}%n/%{$fg_bold[red]%}NOR%{$reset_color%}%{$fg[red]%}]%#%{$reset_color%} "
#	;;
#    main|viins)
#	PROMPT="%{$fg[red]%}[%{$reset_color%}%n/%{$fg_bold[cyan]%}INS%{$reset_color%}%{$fg[red]%}]%#%{$reset_color%} "
#	;;
#    esac
#	zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
export PATH=¨/usr/bin:$PATH¨
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PERL_LOCAL_LIB_ROOT="/home/horoama/perl5";
export PERL_MB_OPT="--install_base /home/horoama/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/horoama/perl5";
export PERL5LIB="/home/horoama/perl5/lib/perl5/x86_64-linux-thread-multi:/home/horoama/perl5/lib/perl5";
export PATH="/home/horoama/perl5/bin:$PATH";

alias emacs="vim"
alias sl="ls"
alias cim="vim"
