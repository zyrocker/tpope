# ~/.login

if ( -f "$HOME/.login.local" ) source "$HOME/.login.local"

if ( $?prompt && { test -t 1 } ) then
  if ( ! -f "$HOME/. tpope" ) then
    echo 'Performing an initial "tpope setup"'
    tpope setup
  else if ( ! $?SHLVL && ( ! $?SSH_TTY || $?TERMCAP ) ) then
      if ( -x /usr/games/fortune ) /usr/games/fortune
  endif

  if ( -f "$HOME/.hushlogin" ) then
    if ( -x /usr/bin/finger ) then
      finger $USER | grep '^New mail' >&/dev/null && echo "You have new mail."
    else if ( $?MAIL ) then
      if ( -f "$MAIL" ) find "$MAIL" -newerma "$MAIL" -exec echo 'You have new mail.' \;
    endif
  endif

  tpope cron --login
endif
