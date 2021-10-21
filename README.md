# Emacs configuration

## Setting up

We have three things we need to symlink when setting up our `~/.emacs.d` directory.

First, `init.el` which will set up everything:
```bash
$ ln -s ~/<repos>/emacs.d/init.el
```

Then, the modules directory which contains configuration for various modes and
languages:
```bash
$ ln -s ~/<repos>/emacs.d/modules
```

Finally, since we're using [straight.el](), we should add our lockfiles:
```bash
$ mkdir straight
$ ln -s ~/<repos>/emacs.d/versions straight
```
