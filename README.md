# `gconf`: Switch `gcloud` configurations

![Proudly written in Bash](https://img.shields.io/badge/written%20in-bash-ff69b4.svg)

Makes it easier to switch configurations in the `gcloud` CLI.

Idea and patterns stolen from [ahmetb's kubectx](https://github.com/ahmetb/kubectx). Go check it out, it's awesome!

# Usage

`gcloud init` your configurations, then:

```
gconf                    : list available configs
gconf <NAME>             : activate config
gconf -                  : switch to previously active config
gconf -h,--help          : show this message
```

-----

## Installation

Since `gconf` is written in Bash, you should be able to install
it to any POSIX environment that has Bash installed.

- Download the `gconf` script.
- Either:
  - save it somewhere in your `PATH`,
  - or save it to a directory, then create symlinks to `gconf` from
    somewhere in your `PATH`, like `/usr/local/bin`
- Make `gconf` executable (`chmod +x ...`)
- Install bash/zsh/fish [completion scripts](completion/).  
  - For zsh:  
    The completion scripts have to be in a path that belongs to `$fpath`. Either link or copy them to an existing folder.  
    If using oh-my-zsh you can do as follows:
    ```bash
    git clone https://github.com/uhinze/gconf.git ~/.gconf
    mkdir -p ~/.oh-my-zsh/completions
    chmod -R 755 ~/.oh-my-zsh/completions
    ln -s ~/.gconf/completion/gconf.zsh ~/.oh-my-zsh/completions/_gconf.zsh
    ```  
    If autocomplete isn't loaded on logout/login, try the following:
    ```
    compinit -d $ZSH_COMPDUMP
    ```
    This refreshes the compinit dumpfile.
  - For bash:
    ```bash
    git clone https://github.com/uhinze/gconf.git ~/.gconf
    COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
    ln -sf ~/.gconf/completion/gconf.bash $COMPDIR/gconf
    ```
  - For fish:
    ```fish
    mkdir -p ~/.config/fish/completions
    ln -s /opt/gconf/completion/gconf.fish ~/.config/fish/completions/
    ```

-----

### Interactive mode

If you want `gconf` to present you an interactive menu
with fuzzy searching, you just need to [install
`fzf`](https://github.com/junegunn/fzf) in your PATH.

If you have `fzf` installed, but want to opt out of using this feature, set the environment variable `GCONF_IGNORE_FZF=1`.


-----

### Customizing colors

If you like to customize the colors indicating the current namespace or context, set the environment variables `GCONF_CURRENT_FGCOLOR` and `GCONF_CURRENT_BGCOLOR` (refer color codes [here](https://linux.101hacks.com/ps1-examples/prompt-color-using-tput/)):

```
export GCONF_CURRENT_FGCOLOR=$(tput setaf 6) # blue text
export GCONF_CURRENT_BGCOLOR=$(tput setab 7) # white background
```

Colors in the output can be disabled by setting the
[`NO_COLOR`](http://no-color.org/) environment variable.
