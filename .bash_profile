export PATH=$PATH:~/bin:~/.composer/vendor/bin

export CLICOLOR=1


# Set Colors

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

#
# Headers and  Logging
#

e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}


# Creates Lumen Project
lumengod() {
	if [ -z "$1" ]; then
		printf "${bold}${purple}-- Check it out you dingus --

'You furgots the paramaters.'

'For Your Code!'

- Steve Brule${reset}
"
	else
		BLUE='\e[36m'
		NC='\e[0m' # No Color
		printf "${BLUE}Creating new lumen app ${NC}\n"
		lumen new $1 > /dev/null
		cd $1
		printf "${BLUE}Installing Homestead Package... ${NC}\n"
		composer require laravel/homestead --dev > /dev/null
		printf "${BLUE}Making Homestead Package... ${NC}\n"
		php vendor/bin/homestead make > /dev/null
		sed -i '' "s/homestead.app/$1.local/g" Homestead.yaml > /dev/null

		ip="$(egrep -o '192.168.10.[0-9]{1,3}' '/private/etc/hosts' | tail -1)"
		if [ -z "$ip" ]
		then
			sudo sh -c "echo \"192.168.10.10 $1.local\" >> /private/etc/hosts"
			printf "${BLUE}192.168.10.10 $1.local Added to host file ${NC}"
			printf "\n"
		else
			lastdigits=`echo "$ip" | sed 's!/.*!!; s!.*\.!!'`
			nextip=$((lastdigits+1))
			sudo sh -c "echo \"192.168.10.$nextip $1.local\" >> /private/etc/hosts"
			printf "${BLUE}192.168.10.$nextip $1.local Added to host file ${NC}"
			printf "\n"
			sed -i '' "s/ip: \"192.168.10.10\"/ip: \"192.168.10.$nextip\"/g" Homestead.yaml > /dev/null
		fi
		read -r -p "Install Faker? [y/N] " response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
		then
			composer require fzaninotto/faker --dev > /dev/null
			printf "${BLUE}Faker Installed ${NC}\n"
		fi
		read -r -p "Install illuminate/html? [y/N] " response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
		then
			composer require illuminate/html > /dev/null
			printf "${BLUE}illuminate/html Installed ${NC}\n"
		fi
		printf "${BLUE}Booting up Vagrant box ${NC}\n"
		sudo vagrant up >/dev/null
		printf "${BLUE}Vagrant Box Booted ${NC}\n"
		echo "Your new laravel app should now be available at http://$1.local";
	fi

}


# Creates Laravel Project
laravelgod() {
	if [ -z "$1" ]; then
		printf "${bold}${purple}-- Check it out you dingus --

'You furgots the paramaters.'

'For Your Code!'

- Steve Brule${reset}
"
	else
echo '

       !
       !
       ^
      / \
     /___\
    |=   =|
    |     |
    |     |
    |     |
    |     |
    |     |
    |     |
    |     |
    |     |
    |     |
   /|##|##|\
  / |##|##| \
 /  |##|##|  \
|  / ^ | ^ \  |
| /  ( | )  \ |
|/   ( | )   \|
    ((   ))
   ((  :  ))
   ((  :  ))
    ((   ))
     (( ))
      ( )
       .
       .
       .
' | lolcat
		BLUE='\e[36m'
		NC='\e[0m' # No Color
		printf "${BLUE}Creating new laravel app ${NC}\n"
		laravel new $1 > /dev/null
		cd $1
		printf "${BLUE}Installing Homestead Package... ${NC}\n"
		composer require laravel/homestead --dev > /dev/null
		printf "${BLUE}Making Homestead Package... ${NC}\n"
		php vendor/bin/homestead make > /dev/null
		sed -i '' "s/homestead.app/$1.local/g" Homestead.yaml > /dev/null

		ip="$(egrep -o '192.168.10.[0-9]{1,3}' '/private/etc/hosts' | tail -1)"
		if [ -z "$ip" ]
		then
			sudo sh -c "echo \"192.168.10.10 $1.local\" >> /private/etc/hosts"
			printf "${BLUE}192.168.10.10 $1.local Added to host file ${NC}"
			printf "\n"
		else
			lastdigits=`echo "$ip" | sed 's!/.*!!; s!.*\.!!'`
			nextip=$((lastdigits+1))
			sudo sh -c "echo \"192.168.10.$nextip $1.local\" >> /private/etc/hosts"
			printf "${BLUE}192.168.10.$nextip $1.local Added to host file ${NC}"
			printf "\n"
			sed -i '' "s/ip: \"192.168.10.10\"/ip: \"192.168.10.$nextip\"/g" Homestead.yaml > /dev/null
		fi
		read -r -p "Install Faker? [y/N] " response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
		then
			composer require fzaninotto/faker --dev > /dev/null
			printf "${BLUE}Faker Installed ${NC}\n"
		fi
		read -r -p "Install illuminate/html? [y/N] " response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
		then
			composer require illuminate/html > /dev/null
			printf "${BLUE}illuminate/html Installed ${NC}\n"
		fi
		printf "${BLUE}Booting up Vagrant box ${NC}\n"
		sudo vagrant up >/dev/null
		printf "${BLUE}Vagrant Box Booted ${NC}\n"
echo '
  ______   _______  _______  _______  _______
(  ___ \ (  ___  )(  ___  )(  ___  )(       )
| (   ) )| (   ) || (   ) || (   ) || () () |
| (__/ / | |   | || |   | || |   | || || || |
|  __ (  | |   | || |   | || |   | || |(_)| |
| (  \ \ | |   | || |   | || |   | || |   | |
| )___) )| (___) || (___) || (___) || )   ( |
|/ \___/ (_______)(_______)(_______)|/     \|


 ' | lolcat
		cowsay "Your new laravel app should now be available at http://$1.local" | lolcat
	fi

}

# Add host to hosts file
addHost() {
		if [ -z "$1" ]; then
			e_error "Please enter a IP address"
		else
				if [ -z "$2" ]; then
					e_error "Please enter a host address"
				else
					sudo sh -c "echo \"$1 $2\" >> /private/etc/hosts"
					e_success "Host added to hosts file"
				fi
		fi
}

# Images
# Quickly get image dimensions from the command line
# SRC: http://brettterpstra.com/2013/07/24/bash-image-tools-for-web-designers/
imgsize () {
	local width height
	if [[ -f $1 ]]; then
		height=$(sips -g pixelHeight "$1"|tail -n 1|awk '{print $2}')
		width=$(sips -g pixelWidth "$1"|tail -n 1|awk '{print $2}')
		e_success "${width} x ${height}"
	else
		e_error "File not found"
	fi
}

# encode a given image file as base64 and output css background property to clipboard
# SRC: http://brettterpstra.com/2013/07/24/bash-image-tools-for-web-designers/
64enc () {
	openssl base64 -in $1 | awk -v ext="${1#*.}" '{ str1=str1 $0 }END{ print "background:url(data:image/"ext";base64,"str1");" }'|pbcopy
	e_success "$1 encoded to clipboard"
}

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:        	Open file in quick look

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
cdf () {
	currFolderPath=$( /usr/bin/osascript <<EOT
		tell application "Finder"
			try
		set currFolder to (folder of the front window as alias)
			on error
		set currFolder to (path to desktop folder as alias)
			end try
			POSIX path of currFolder
		end tell
EOT
	)
	e_note "cd to \"$currFolderPath\""
	cd "$currFolderPath"
}

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     e_error "'$1' cannot be extracted via extract()" ;;
         esac
     else
         e_error "'$1' is not a valid file"
     fi
}
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'


# Grabs headers from web page
httpHeaders () { 
  /usr/bin/curl -I -L $@ ; 
}   

# Download a web page and show info on what took time
httpDebug () { 
  /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; 
}



#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#   ---------------------------
#   My Bash Stuff
#   ---------------------------

alias editbash='atom ~/.bash_profile' # Open this file in atom
alias reload_profile=". ~/.bash_profile" # Reload the profile in current terminal window

# Hosts stuff
alias addhost=addHost                         # add host to host file
alias edithost='sudo vim /private/etc/hosts'  # Open host file for editing in VIM

# Directories
alias c="clear"                                         # Shortcut for clearing terminal
alias gotweb="cd ~/Code"                                # Goto code directory
alias killDS='find . -name *.DS_Store -type f -delete'  # Remove all the lame .DS_Store files
alias mkdir="mkdir -pv"                                 # Update mkdir to handle parent directories
alias l='ls -la'                                        # Quick list all
alias ls='ls -FGlAhp'                                   # Quick list without parents
alias rmall="sudo rm -rf $1"                            # Remove all the things! Seriously bad times.

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias home="cd ~"                                               # Goto home directory
alias f='open -a Finder ./'                                     # Open current directory in Finder
alias numfiles='echo $(ls -1 | wc -l)'                          # Display number of files in directory

# alias chownuser='sudo chown -R : ./'                          # Update ownership of directory (Need to update)

# Confirmation
alias mv='mv -i'                # Prompt overwite on moving files
alias cp='cp -i'                # Prompt overwite on copying files
alias ln='ln -i'                # Prompt overwite on symlinking files

# Networking
alias myip='curl ip.appspot.com; echo ""'     # Get my current IP
alias localip='ipconfig getifaddr en0'        # Get my current IP on local network


# Coding
alias edit='atom ./'    # Open current directory in Atom
alias a='atom'          # Open Atom

# Browsers
alias firefox="open -a firefox"         # Open Firefox
alias safari="open -a safari"           # Open Safari
alias chrome="open -a google\ chrome"   # Open Chrome
alias browser=chrome                    # Open Default browser (chrome)

# October
alias par="php artisan plugin:refresh"  # Refresh Plugin in october CMS
alias pa="php artisan"                  # Shortcut for php artisan

#Git
alias ss="git status -s"                                                                    # Display shorthand git status
alias s="git status -s | lolcat"                                                            # Display shorthand git status with amaing lolcat
alias pullmaster="git pull origin master"                                                   # Pull master branch
alias pushmaster="git push origin master; e_success 'Commits pushed to master'"             # Push master branch
alias pushstaging="git push origin staging; e_success 'Commits pushed to staging'"          # Push staging branch
alias pushdev="git push origin development; e_success 'Commits pushed to development'"      # Push development branch
alias master="git checkout master"                                                          # Checkout master branch
alias staging="git checkout staging"                                                        # Checkout staging branch
alias dev="git checkout development"                                                        # Checkout development branch
alias gm="git merge"                                                                        # Merge Branch
alias pull="git pull origin"                                                                # Pull from origin
alias gch="git checkout"                                                                    # Checkout Branch
alias branch="git branch"                                                                   # List Branches
alias gcm="git commit -m"                                                                   # Shorthand for commiting
alias gadd="git add -A .; e_success 'Files added to be committed'"                          # Stage files
alias gacm="git add -A .; e_success 'Files added to be committed'; git commit -m"           # Stage files then commit them with message
alias glog="git log --oneline"                                                              # View short git log

# Add Homestead to laravel project
alias injecthomestead="composer require laravel/homestead --dev && php vendor/bin/homestead make"

# Vagrant Stuff
alias vhalt="sudo vagrant halt"         # Halt Vagrant Box        
alias vup="sudo vagrant up"             # Boot up Vagrant Box
alias vdel="sudo vagrant destroy"       # Destroy Vagrant Box
alias vm="sudo vagrant ssh"             # SSH into Vagrant Box
alias vmstatus="vagrant global-status"  # View global status of vagrant, shows which boxes are running

# Shutdown a virtual machine
alias shutdown-vms="VBoxManage list vms | cut -f 1 -d ' ' | xargs -I NAME sh -c 'VBoxManage controlvm NAME poweroff ; VBoxManage unregistervm NAME' ; rm -rf ~/VirtualBox\ VMs/*"
