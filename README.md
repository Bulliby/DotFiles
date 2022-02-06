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
