# shell-things

This is repository for important files, which I prefer to have everywhere.

### License

See [LICENSE.md] in this folder.

[LICENSE.md]:LICENSE.md

## Downloading without git (NEW!)

I wrote a script to download files in this repository without git.

NOTE: If the fourth command gives you "BAD SIGNATURE", proceed with caution!

```
wget -O shell-things.sh http://mkaysi.github.com/shell-things.sh
wget -O shell-things.sh.asc http://mkaysi.github.com/shell-things.sh.asc
gpg --fetch-keys http://mkaysi.github.com/PGP/0x82A46728.txt
gpg --verify shell-things.sh.asc
chmod +x shell-things.sh && ./shell-things.sh
```

## What is what

### root

.cat.sh — script which puts (almost) everything on it's correct place. *WARNING:* It will *overwrite* the current versions of those files if they exist. That is why it's hidden (dot)file.

.gitignore — list of files, which git shouldn't add to this repository.

bashrc — [Bourne Again SHell] config file

gitconfig — [git] config file

notMkaysi — file which can be pasted to ~/.custom to evade some things, which can be annoyances for others than me.

pastebinit.xml — [pastebinit] config file

vimrc — [Vi IMproved] config file

xsessionrc — what is executed on X logon

oidentd.conf — configuration file for [Oidentd].

tmux.conf — configuration file for [Tmux] terminal multiplexer.

warnings — script, which suggests Debian packages, which files in this repository think you should have

zshrc — The [Z SHell] config file

### gnupg/ — GnuPG related config files

gpg.conf — [GnuPG] config file

pgprules.xml.asc — *ENCRYPTED* Enigmail Per-Recepient rules.

[Bourne Again SHell]:http://tiswww.case.edu/php/chet/bash/bashtop.html
[git]:http://git-scm.com/
[pastebinit]:http://launchpad.net/pastebinit/
[Vi IMproved]:http://www.vim.org/
[Oidentd]:http://ojnk.sourceforge.net/
[Tmux]:http://tmux.sourceforge.net/
[Z Shell]:http://www.zsh.org/
[GnuPG]:http://www.gnupg.org
