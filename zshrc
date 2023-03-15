# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rico/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# BEGIN ANSIBLE MANAGED BLOCK
alias o='openstack'

alias ob='openstack baremetal'
alias obn='openstack baremetal node'
alias obnc='openstack baremetal node create'
alias obnl='openstack baremetal node list'
alias obnu='openstack baremetal node update'
alias obnd='openstack baremetal node delete'
alias obns='openstack baremetal node show'

alias obp='openstack baremetal port'
alias obpc='openstack baremetal port create'
alias obpl='openstack baremetal port list'
alias obpu='openstack baremetal port update'
alias obpd='openstack baremetal port delete'
alias obps='openstack baremetal port show'

alias obpg='openstack baremetal port group'
alias obpgc='openstack baremetal port group create'
alias obpgl='openstack baremetal port group list'
alias obpgu='openstack baremetal port group update'
alias obpgd='openstack baremetal port group delete'
alias obpgs='openstack baremetal port group show'

alias on='openstack network'
alias onc='openstack network create'
alias onl='openstack network list'
alias onu='openstack network update'
alias ond='openstack network delete'
alias ons='openstack network show'

alias ona='openstack network agent'
alias onar='openstack network agent router'
alias onaar='openstack network agent add router'
alias onarr='openstack network agent remove router'
alias onal='openstack network agent list'

alias oi='openstack image'
alias oic='openstack image create'
alias oil='openstack image list'
alias oiu='openstack image update'
alias oid='openstack image delete'
alias ois='openstack image show'

alias ose='openstack server'
alias osec='openstack server create'
alias osel='openstack server list'
alias oseu='openstack server update'
alias osed='openstack server delete'
alias oses='openstack server show'

alias ofi='openstack floating ip'
alias ofic='openstack floating ip create'
alias ofil='openstack floating ip list'
alias ofiu='openstack floating ip update'
alias ofid='openstack floating ip delete'
alias ofis='openstack floating ip show'

alias ok='openstack keypair'
alias okc='openstack keypair create'
alias okl='openstack keypair list'
alias oku='openstack keypair update'
alias okd='openstack keypair delete'
alias oks='openstack keypair show'

alias of='openstack flavor'
alias ofc='openstack flavor create'
alias ofl='openstack flavor list'
alias ofu='openstack flavor update'
alias ofd='openstack flavor delete'
alias ofs='openstack flavor show'

alias op='openstack port'
alias opc='openstack port create'
alias opl='openstack port list'
alias opu='openstack port update'
alias opd='openstack port delete'
alias ops='openstack port show'

alias oe='openstack endpoint'
alias oec='openstack endpoint create'
alias oel='openstack endpoint list'
alias oeu='openstack endpoint update'
alias oed='openstack endpoint delete'
alias oes='openstack endpoint show'

alias osg='openstack security group'
alias osgc='openstack security group create'
alias osgl='openstack security group list'
alias osgu='openstack security group update'
alias osgd='openstack security group delete'
alias osgs='openstack security group show'

alias osub='openstack subnet'
alias osubc='openstack subnet create'
alias osubl='openstack subnet list'
alias osubu='openstack subnet update'
alias osubd='openstack subnet delete'
alias osubs='openstack subnet show'

alias ov='openstack volume'
alias ovc='openstack volume create'
alias ovl='openstack volume list'
alias ovu='openstack volume update'
alias ovd='openstack volume delete'
alias ovs='openstack volume show'

alias os='openstack stack'
alias osc='openstack stack create'
alias osl='openstack stack list'
alias osu='openstack stack update'
alias osd='openstack stack delete -y'
alias oss='openstack stack show'
alias osos='openstack stack output show'
alias osol='openstack stack output list'
alias osrs='openstack stack resource show'
alias osrl='openstack stack resource list'
alias osrm='openstack stack resource metadata'
alias osrmu='openstack stack resource mark unhealthy'
alias osrsi='openstack stack resource signal'


alias olb='openstack loadbalancer'
alias olbc='openstack loadbalancer create'
alias olbl='openstack loadbalancer list'
alias olbu='openstack loadbalancer update'
alias olbd='openstack loadbalancer delete'
alias olbs='openstack loadbalancer show'

alias oct='openstack coe cluster template'
alias octc='openstack coe cluster template create'
alias octl='openstack coe cluster template list'
alias octs='openstack coe cluster template show'
alias octd='openstack coe cluster template delete'
alias octu='openstack coe cluster template update'
alias oc='openstack coe cluster'
alias occ='openstack coe cluster create'
alias ocl='openstack coe cluster list'
alias ocs='openstack coe cluster show'
alias ocd='openstack coe cluster delete'
alias ocu='openstack coe cluster update'


alias gstatus='git status'
alias gst='git stash'
alias gstp='git stash pop'
alias gpl='git pull'
alias gr='git review -y'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcomp='git checkout master && git pull'
alias gcob='git checkout -b'
alias gcoB='git checkout -B'
alias greb='git rebase -i'
alias grebm='git rebase -i master'
alias grebc='git rebase --continue' 
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gaca='git add -u && git commit -v --amend'
alias gaac='git add -u && git commit -v'

alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get po'
alias kga='kubectl get all'
alias kgn='kubectl get node'
alias kgs='kubectl get service'
alias kgi='kubectl get ingress'
alias kgd='kubectl get deployment'
alias kgj='kubectl get job'
alias kgcm='kubectl get configmap'
alias kgse='kubectl get secret'
alias kgc='kubectl get certificate'
alias kd='kubectl describe'
alias kdp='kubectl describe po'
alias kdn='kubectl describe node'
alias kds='kubectl describe service'
alias kdi='kubectl describe ingress'
alias kdd='kubectl describe deployment'
alias kdj='kubectl describe job'
alias kdcm='kubectl describe configmap'
alias kdse='kubectl describe secret'
alias kdc='kubectl describe certificate'
alias kl='kubectl logs'
alias kc='kubectl config'
alias kcs='kubectl config use-context'
alias kcc='kubectl config get-contexts'
alias ke='kubectl edit'
alias kx='kubectl exec -it'
alias kms='kubectl modify-secret'

alias kk='kubectl -n kube-system'
alias kkg='kubectl -n kube-system get'
alias kkgp='kubectl -n kube-system get po'
alias kkga='kubectl -n kube-system get all'
alias kkgs='kubectl -n kube-system get service'
alias kkgi='kubectl -n kube-system get ingress'
alias kkgd='kubectl -n kube-system get deployment'
alias kkgj='kubectl -n kube-system get job'
alias kkgcm='kubectl -n kube-system get configmap'
alias kkgse='kubectl -n kube-system get secret'
alias kkgc='kubectl -n kube-system get certificate'
alias kkd='kubectl -n kube-system describe'
alias kkds='kubectl -n kube-system describe service'
alias kkdp='kubectl -n kube-system describe pod'
alias kkdi='kubectl -n kube-system describe ingress'
alias kkdd='kubectl -n kube-system describe deployment'
alias kkdj='kubectl -n kube-system describe job'
alias kkdcm='kubectl -n kube-system describe configmap'
alias kkdse='kubectl -n kube-system describe secret'
alias kkdc='kubectl -n kube-system describe certificate'
alias kkl='kubectl -n kube-system logs'
alias kke='kubectl -n kube-system edit'
alias kkx='kubectl -n kube-system exec -it'
alias kkms='kubectl modify-secret -n kube-system'

alias ko='kubectl -n openstack'
alias kog='kubectl -n openstack get'
alias kogp='kubectl -n openstack get po'
alias koga='kubectl -n openstack get all'
alias kogs='kubectl -n openstack get service'
alias kogi='kubectl -n openstack get ingress'
alias kogd='kubectl -n openstack get deployment'
alias kogj='kubectl -n openstack get job'
alias kogcm='kubectl -n openstack get configmap'
alias kogse='kubectl -n openstack get secret'
alias kogc='kubectl -n openstack get certificate'
alias kod='kubectl -n openstack describe'
alias kods='kubectl -n openstack describe service'
alias kodp='kubectl -n openstack describe pod'
alias kodi='kubectl -n openstack describe ingress'
alias kodd='kubectl -n openstack describe deployment'
alias kodj='kubectl -n openstack describe job'
alias kodcm='kubectl -n openstack describe configmap'
alias kodse='kubectl -n openstack describe secret'
alias kodc='kubectl -n openstack describe certificate'
alias kol='kubectl -n openstack logs'
alias koe='kubectl -n openstack edit'
alias kox='kubectl -n openstack exec -it'
alias koms='kubectl modify-secret -n openstack'

alias km='kubectl -n monitoring'
alias kmg='kubectl -n monitoring get'
alias kmgp='kubectl -n monitoring get po'
alias kmga='kubectl -n monitoring get all'
alias kmgs='kubectl -n monitoring get service'
alias kmgi='kubectl -n monitoring get ingress'
alias kmgd='kubectl -n monitoring get deployment'
alias kmgj='kubectl -n monitoring get job'
alias kmgcm='kubectl -n monitoring get configmap'
alias kmgse='kubectl -n monitoring get secret'
alias kmgc='kubectl -n monitoring get certificate'
alias kmd='kubectl -n monitoring describe'
alias kmds='kubectl -n monitoring describe service'
alias kmdp='kubectl -n monitoring describe pod'
alias kmdi='kubectl -n monitoring describe ingress'
alias kmdd='kubectl -n monitoring describe deployment'
alias kmdj='kubectl -n monitoring describe job'
alias kmdcm='kubectl -n monitoring describe configmap'
alias kmdse='kubectl -n monitoring describe secret'
alias kmdc='kubectl -n monitoring describe certificate'
alias kml='kubectl -n monitoring logs'
alias kme='kubectl -n monitoring edit'
alias kmx='kubectl -n monitoring exec -it'
alias kmms='kubectl modify-secret -n monitoring'

alias kcm='kubectl -n cert-manager'
alias kcmg='kubectl -n cert-manager get'
alias kcmgp='kubectl -n cert-manager get po'
alias kcmga='kubectl -n cert-manager get all'
alias kcmgs='kubectl -n cert-manager get service'
alias kcmgi='kubectl -n cert-manager get ingress'
alias kcmgd='kubectl -n cert-manager get deployment'
alias kcmgj='kubectl -n cert-manager get job'
alias kcmgcm='kubectl -n cert-manager get configmap'
alias kcmgse='kubectl -n cert-manager get secret'
alias kcmgc='kubectl -n cert-manager get certificate'
alias kcmd='kubectl -n cert-manager describe'
alias kcmds='kubectl -n cert-manager describe service'
alias kcmdp='kubectl -n cert-manager describe pod'
alias kcmdi='kubectl -n cert-manager describe ingress'
alias kcmdd='kubectl -n cert-manager describe deployment'
alias kcmdj='kubectl -n cert-manager describe job'
alias kcmdcm='kubectl -n cert-manager describe configmap'
alias kcmdse='kubectl -n cert-manager describe secret'
alias kcmdc='kubectl -n cert-manager describe certificate'
alias kcml='kubectl -n cert-manager logs'
alias kcme='kubectl -n cert-manager edit'
alias kcmx='kubectl -n cert-manager exec -it'
alias kcmms='kubectl modify-secret -n cert-manager'

alias ts='tsh ssh'
alias tst='tsh status'
alias tln='tsh login'
alias tls='tsh ls'
alias tk='tsh kube'
alias tkls='tsh kube ls'
alias tkln='tsh kube login'

alias grpe='grep'

. ~/openrc

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/Envs
# END ANSIBLE MANAGED BLOCK


# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
