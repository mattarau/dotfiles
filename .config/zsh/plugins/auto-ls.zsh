# Automatically list directory contents on `cd`.
auto-ls() { ls; }
chpwd_functions=(auto-ls $chpwd_functions)

