{ ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export PS1="\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "
    '';
  };
}
