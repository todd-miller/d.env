# Dev Container
portable development environment within a container.

## Key Items:
- get and install dotfiles within clean linux env
    - need entrypoint.sh!
- map volumes from host machine into container
    - `projects`
    - `repos`
- map ports between host and container
    - can I get debug to work?

## Entrypoint.sh
- install zap
- remove .zshrc
- remove $HOME/.config/
- clone dotfiles 
- stow dotfiles

