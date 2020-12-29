. ~/.config/omf/aliases.fish
set -xg MINIKUBE_HOME /mnt/linux-hd/minikube
set -xg EDITOR vim

eval (direnv hook fish)

set -xg PATH $PATH /home/eduardo/.local/bin
set -xg PATH $PATH /usr/local/go/bin
set -xg PATH $PATH /home/eduardo/bin

set -xg PATH $PATH (go env GOPATH)/bin
set -xg GOPATH (go env GOPATH)

fish_vi_key_bindings
# https://github.com/fish-shell/fish-shell/issues/3299#issuecomment-288031946
# use $ to accept autocomplete
function fish_user_key_bindings
     bind \cl clear
     bind -M default \$ end-of-line accept-autosuggestion
end
fish_vi_key_bindings
set -g fish_escape_delay_ms 10


# functions
function chromecast
	  if test (count $argv) -lt 2; or test $argv[1] = "--help"
	    echo "Usage: {chromecast_name} {files}"
  	end

	vlc -I Ncurses $argv[2..-1] --sout "#chromecast" --demux-filter=demux_chromecast --sout-chromecast-ip=$argv[1] 
end

function fish_greeting
  fortune /home/eduardo/projects/picard-tips/ | fold -s -w80 | boxes -d stone -a c
end

starship init fish | source
