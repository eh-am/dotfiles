if status is-interactive
    # Commands to run in interactive sessions can go here
end


source /opt/homebrew/opt/asdf/libexec/asdf.fish

direnv hook fish | source

fish_vi_key_bindings

starship init fish | source


function fish_greeting
 fortune ~/projects/picard-tips-fortune/ | fold -s -w80 | boxes -d stone -a c
end

# aliases
alias vim=nvim
alias cat=bat
alias firefox="open -a firefox -n --args -p"
