# ----- My own config settings added -----------------------------------------
# 	Wim Alsemgeest
# ----------------------------------------------------------------------------

# ----- Add local bin to path ------------------------------------------------
PATH=/home/wim/.local/bin:$PATH

# ----- Navigation aliases ---------------------------------------------------
alias ..='cd ..'
alias ...='cd ..\..'
alias .3='cd ..\..\..'
alias .4='cd ..\..\..\..'
alias .5='cd ..\..\..\..\..'

# ----- Replace cat with bat, and set bat as manpager ------------------------
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
alias cat='batcat'

# ----- Replace ls with exa --------------------------------------------------
alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias la='exa -la --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | rg "^\."'

# ----- Confirm before overwriting something ---------------------------------
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ----- Add starship commandline prompt --------------------------------------
eval "$(starship init bash)"

# ----- Execute Neofetch -----------------------------------------------------
neofetch

