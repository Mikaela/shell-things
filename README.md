# What is this?

This is collection of files which I prefer to have everywhere.

## Where does the name "shell-things" come from? / History

In the beginning this repository was only GitHub gist and contained only two files,
bashrc. Then I moved to zsh and abandoned .bashrc. Some time after that I got need for
having both files so I merged them into shell-things. At some point there came many
other files from which some aren't related to shells, but I don't want to rename it.

## How do I use this?

Just read the files and copy-paste some things which you need or run the install.run file.

```
./install.run
```

<b>WARNING: install.run CAN CAUSE DATA LOSS BY OVERWRITING EVERYTHING WHAT IT ADDS!</b>

## Can I share this

Yes. If you take something from these files, you can freely redistribute it even without mentioning the source.  I am trying to mention original sources in these files.

## What are .something.MKAYSIGREP files?

They are outputs of

```
grep <file> MKAYSIGREP
```

and contain modifications which might not be useful to other people than me.

.install.MKAYSIGREP.run is installation for them.

<!---

## MKAYSIGREP depedencies - this is meant only for me

### apt

```
apt-get install vim most htop gnupg2 lynx pandoc gnupg-agent flip youtube-dl
```

### yum

```
rpm --install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
rpm --install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
rpm --install http://rpm.livna.org/livna-release.rpm

yum -y install vim most htop gnupg2 lynx pandoc youtube-dl
--->
