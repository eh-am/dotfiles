# https://github.com/fish-shell/fish-shell/issues/3299#issuecomment-288031946                         
# use $ to accept autocomplete                                                                        
function fish_user_key_bindings                                                                       
     bind \cl clear                                                                                   
     bind -M default \$ end-of-line accept-autosuggestion
