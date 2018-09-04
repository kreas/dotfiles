export ZSH=/Users/$(whoami)/.oh-my-zsh

ZSH_THEME="robbyrussell"

# other configs

# +---------------+
# | Other Configs |
# +---------------+

source $ZSH/oh-my-zsh.sh
. $HOME/.zsh/configs/paths.zsh


# +---------+
# | Plugins |
# +---------+

plugins=(
	git
  dotenv
  iterm2
  encode64
)


