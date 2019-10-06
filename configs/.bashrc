# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Aliases
alias g="git"
alias s="ssh"
alias la="ls -lAh --group-directories-first"

# Archive extractor
complete -f -X '!*.@(tar.gz|tgz|tar.bz2|tbz2|xz|tar|zip|rar|7z|bz2)' extract
extract() {
    if [[ ! -r $1 ]]; then
        echo "File '$1' not found" >&2
    fi

    case $1 in
        *.tar.gz)   tar -xzvf $1    ;;
        *.tgz)      tar -xzvf $1    ;;
        *.tar.bz2)  tar -xjvf $1    ;;
        *.tbz2)     tar -xjvf $1    ;;
        *.xz)       xz -dvk $1      ;;
        *.tar)      tar -xvf $1     ;;
        *.zip)      unzip $1        ;;
        *.rar)      unrar x "$1"    ;;
        *.7z)       7za x $1        ;;
        *.bz2)      bunzip2 -vk $1  ;;
        *)          echo "Invalid file format" >&2 ;;
    esac
}
