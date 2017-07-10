# [variables]
  export LANG=en_US.UTF-8		# Sets the character encoding
  export EDITOR='vim'			# Sets the default editor
  export ZSH=/home/$USER/.oh-my-zsh 	# Path to your oh-my-zsh installation.
  ZSH_THEME="wezm+"			# Sets the zsh theme
  HIST_STAMPS="dd.mm.yyyy"		# Sets the history time stamp format

# Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
  else
   export EDITOR='vim'
  fi

#[plugins]

  source $ZSH/oh-my-zsh.sh		# Source dir for zsh plugins
  plugins=(git)				# List of plugins


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#[Aliases] 

  alias youtube-dl="youtube-dl-mp3"	# Alias for yourtube-dl-mp3
  alias youtube-vdl="youtube-dl-mp3 -k" # Alias for youtube-dl-mp3 w/ video
  alias firefox="waterfox"		# Alias for waterfox
