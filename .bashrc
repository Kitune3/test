if [ $SHLVL = 1 -a "$TERM" != 'dumb' ] ; then
    /usr/bin/screen
fi

if [ x$TERM = "xscreen" ]; then
    # PROMPT_COMMAND='echo -ne "\ek`echo $HOSTNAME`\e\\"'
    PS1=${PS1}'\[\033k\W\033\\\]'
fi

export EDITOR=emacs
