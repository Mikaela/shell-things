## What is this?

This repository has my rc-files other things that I want to have everywhere.

[![Visit our IRC channel](https://kiwiirc.com/buttons/chat.freenode.net/%23Mikaela.png)](https://kiwiirc.com/client/chat.freenode.net:+6697/##Mikaela)

### Where does the name "shell-things" come from? / History

In the beginning this repository was only GitHub gist and contained only 
two files, bashrc. 

Then I moved to zsh and abandoned .bashrc. 

Some time after that I got need for having both files so I merged them 
into shell-things. At some point there came many other files from which 
some aren't related to shells, but I don't want to rename it.

And why would I rename this? shell-things name is more unique than dotfiles 
and this has been shell-things for years.

### How do I use this?


#### How you should use this.

The best way to use files things like this is to read them and copy-paste 
the things that look useful to you to your own files.

#### How you will most likely use this.

If you are lazy or want to copy me as much as possible, you will install 
git, curl and wget if you don't have them already and run

```
wget https://mkaysi.github.io/shell-things/shell-things.bash
source shell-things.bash
shell-things
source ~/.`echo $SHELL|cut -d/ -f3`rc
```

To upgrade, simply run `shell-things`.

##### How I use this.

As I know everything that is in this repository, I simply do the above.

I know everything that is in this file and how it affects my environment 
and I want it, so I can do that.
