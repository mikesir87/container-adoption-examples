# Container Adoption Examples

This repository contains various demos on how a single project can leverage containers at varying levels of adoption.

## The adoption examples

The adoption examples can be summarized into the following levels:

1. **Hybrid setup**
    - _Description_: The app runs natively on the machine, but dependent services (databases, etc.) run in containers
    - Pros:
        - No need to install databases, caches, etc.
        - Ability to easily add additional tools to help with data visualization (such as a database management tools)
    - Cons:
        - Still need to install and configure the application runtime environment

2. **App in container**
    - _Description_: The app now runs in a container, as well as dependent services. A developer modifies the code through their IDE on the host machine, which is either shared/synced with the container or triggers a rebuild/restart.
    - Pros:
        - Everything is in a container - simply run `docker compose up` and everything works!
    - Cons:
        - Working with debuggers is often quite tricky because the app process is in a container and connecting to it can be challenging depending on language/framework

3. **Devcontainers**
    - _Description_: Everything runs in a container, including the development environment. When the app is opened in VS Code/IntelliJ, the extensions open the workspace _inside_ the container. The files are files from inside the container, the terminal runs inside the container.
    - Pros:
        - Complete consistency across the team
        - Everything is packaged with the project, making it easy to swap projects
        - Includes the ability to specify IDE extensions to install with the project
        - Debuggers and other tools work as expected
    - Cons:
        - Little to no customization available by developers/users - you get only what's bundled in the devcontainer environment
        - Some Docker-in-Docker scenarios are tricky to work with (eg, using Testcontainers)

## Contributing

This repo is intended to support examples for several sample stacks. I intend to add a few more examples over time, but it is not going to be an exhaustive list of all available options. If you want to contribute an example, open an issue first and let's chat!