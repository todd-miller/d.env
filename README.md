# Dev Container
portable development environment within a container.

## Key Items:
- map volumes from host machine into container
    - `projects`
    - `repos`
- map ports between host and container
    - can I get debug to work?
- ssh - (cannot git commit! - this is an issue!)
- maybe run a proxy command and a setup file?
    - have a bash script read from a config-json
        - config per work-machine
        - graphics/no
        - volumes & landing spots
        - ports
        - example command interface: `./build.sh home`, `./build.sh bfusa`
- determine when to stop adding to the generic image
    - ssh
    - graphics test
    - ports mapping
- run in detached mode and shell in
    - can i give my containers a name when i go to run them?

## Entrypoint.sh
- need to clean up:
    - pyenv - this takes a bit of setting up in .zprofile I think
    


