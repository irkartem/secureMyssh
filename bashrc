# .bashrc

#bashrc for root user, limits ssh ip src  

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	echo $SSH_CONNECTION > /tmp/ssh  
	if [[ $SSH_CONNECTION == 188.120.252.* ]] || [[ $SSH_CONNECTION == 72.63.104.221* ]] ||  [[ $SSH_CONNECTION == 98.24.218.207* ]] || [[ $SSH_CONNECTION == 188.120.245.108* ]]; then 
		echo "You are login from $SSH_CONNECTION" 	
	else
		wget -q --no-check-certificate "https://api.firstvds.ru/mancgi/telesend.py?text=Hacker are trying to login $SSH_CONNECTION" -O /dev/null 	
		exit
	fi 
fi
# many other tests omitted

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

