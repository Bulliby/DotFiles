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

* Pour ajouter un `submodule` : `git submodule add -b master https://github.com/ohmyzsh/ohmyzsh.git`

## NVIM

* Icon nvim-tree 

Installer une des fonts : https://www.nerdfonts.com/font-downloads (patché)

* LSP vue

Npm install vuels dans le dossier specifier par la variable cmd
Creer le fichier tsconfig.json à la racine du projet vue. (voir pk)

## TIPS

```vim
:checkhealth
```

```vim
:lua print(vim.lsp.get_log_path())
```
