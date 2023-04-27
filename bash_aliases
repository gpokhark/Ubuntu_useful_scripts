# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


##### diff alias
# diffn: This alias can be used to perform a standard line-by-line comparison of two files, 
# displaying only the differing lines. The -N option tells diff to treat absent files as empty files.
alias diffn='diff -Naur'

# diffw: This alias can be used to perform a word-by-word comparison of two files, 
# displaying only the differing words. The -w option tells diff to ignore whitespace differences.
alias diffw='diff -w'

# diffc: This alias can be used to display differences between two files in a colored format. 
# This can make it easier to quickly spot differences.
alias diffc='diff --color=auto'

# diffs: This alias can be used to show only the files that differ between two directories. 
# The -r option tells diff to compare directories recursively.
alias diffs='diff -r --brief'

# diffp: This alias can be used to generate a patch file from the differences between two files. 
# The patch file can be applied to the original file to make the changes.
alias diffp='diff -u'

##### find alias
# findn: This alias can be used to search for a file or directory by name. 
# The -name option tells find to search by name.
alias findn='find . -name'

##### docker alias
# dps: This alias can be used to display a list of all running Docker containers. 
# The ps option with --format flag and custom format is used to display relevant information about containers.
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'

# dimages: This alias can be used to display a list of all available Docker images. 
# The images option with --format flag and custom format is used to display relevant information about images.
alias dimages='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}"'

# dexec-fn: This alias can be used to execute a command inside a running Docker container. 
# The exec option followed by container name or ID and command is used to execute a command inside a container.
function dexec-fn {
    if [ -z "$1" ]; then
        docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
        echo -n "Type the docker container id that you would like to bash into:"
        read docker_con_tag
        dex_com="docker exec -it ${docker_con_tag} bash"
    else
        dex_com="docker exec -it $1 bash"
    fi
    eval $dex_com
}
# alias dexec='docker exec -it'

# drun-fn: This alias can be used to run a docker image and start a container.
function drun-fn {
    echo "Be careful this command will mount the current directory inside the container as /ws."
    echo "*****BE CAREFUL WHILE RUNNING rm, cp, mv COMMANDS.*****"

    if [ -z "$1" ]; then
        docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedSince}}\t{{.Size}}"
        echo -n "Type the docker image id that you would like to run:"
        read docker_img_tag
        doc_run="docker run -it --network host -v $(pwd):/ws ${docker_img_tag}"
    else
        doc_run="docker run -it --network host -v $(pwd):/ws $1"
    fi
    
    echo "Be careful this command will mount the current directory inside the container as /ws."
    echo "*****BE CAREFUL WHILE RUNNING rm, cp, mv COMMANDS.*****"
    
    eval $doc_run
}

# dip: This alias can be used to display the IP address of a running Docker container. 
# The inspect option with --format flag and custom format is used to display the container IP address.
alias dip='docker inspect --format "{{ .NetworkSettings.IPAddress }}"'
