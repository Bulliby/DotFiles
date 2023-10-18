# DotFiles

## Installation

- Add a target in `Targets` directories.
- Add custom scripts for your environment in `custom.d`

- Use the `deploy.bash` script to deploy your environment

> The `deploy` script act as a global configuration script for all Targets. In `custom.d` we place target's script. 

```shell
./deploy.bash -t home
./deploy.bash --help
```
## NVIM

* Icon nvim-tree 

```shell
pacman -S ttf-cousine-nerd
```

* fzf telescope

```shell
cd ~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim && make
```
* phpactor

```shell
cd ~/.local/share/nvim/site/pack/packer/opt/phpactor && composer install
```

## LSP vue

Npm install vuels dans le dossier specifier par la variable cmd
Creer le fichier tsconfig.json à la racine du projet vue. (voir pk)

## INIT

```shell
cd /home/bulliby/.local/share/nvim/site/pack/packer/opt/phpactor
composer install
```

## TIPS

```vim
:checkhealth
```

```vim
:lua print(vim.lsp.get_log_path())
```
