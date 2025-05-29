# Container Adoption Levels/Examples

This repository contains various demos on how a single project can leverage containers at varying levels of adoption.

## Example apps

The following examples demonstrate the varying adoption levels. Within each example is a subfolder that shows what that adoption level might look like for that particular application stack.

- [Python Dash](./python-dash/) - a simple Dash app that utilizes a PostgreSQL database to display various dashboards



## The adoption levels

There are three different stages of adoption when it comes to using containers in local development. They are outlined in detail below.

**Important note:** this should NOT be seen as "Level 2 is better than Level 1", etc. Each team needs to determine what is the right level for them, as each have their own tradeoffs and complexities.

### Level 1 - Hybrid setup

In this adoption level, the app runs natively on the machine, but dependent services (databases, etc.) run in containers.

This setup is seen often in environments where there is strong IDE integration with the runtimes and runtime debuggers (like Java with IntelliJ). Teams may already have good processes in place to install and configure those runtimes, but want extra help with managing the app's external dependencies.

#### Pros

- Remove the need to install databases, caches, etc.
- Easily manage and update versions of each of those dependencies
- Easily swap dependencies when swapping projects
- Easily add additional tools to help with data visualization (such as a database management tools)

#### Cons

- Requires the application runtime environment to be installed and configured
- Possible drift of runtime versions used in development and what is used when building the container image and deploying it



### Level 2 - App in container

In this adoption level, the app now runs in a container, as well as dependent services. A developer modifies the code through their IDE on the host machine, which is either shared/synced with the container or triggers a rebuild/restart.

This setup is often seen in environments where scripted languages are used and debuggers are less commonly used (debug using console statements). Teams want to enable a simple `git clone` and `docker compose up` approach, but without being completely immersed in a containerized IDE setup.

#### Pros
- All the benefits from Level 1
- No longer need to install an app runtime
- Significantly less risk of drift between development and production version/configurations
- Everything is in a container - simply run `docker compose up` and everything works!

#### Cons

- Code completion from installed libraries/dependencies may not be available without mounting the installed libraries back on the host
- Working with runtime debuggers (setting breakpoints) is often quite tricky because the app process is in a container and connecting to it can be challenging depending on language/framework
- For languages that require compilation, feedback loops may be longer (rebuild image and restart container). Caching those builds may be harder to do too.



### Level 3 - Devcontainers

In this adoption level, everything runs in a container, including the development environment. When the app is opened in VS Code/IntelliJ, IDE extensions open the workspace _inside_ the container. The files being edited in the IDE are files from inside the container. The IDE terminal runs inside the container.

This setup is often seen when teams want to have an extremely consistent development environment across the team. It is also extremely useful for teams that are managing lots of projects or teams in which each project needs slightly different setups and tools (embedded systems, IoT, etc.).

#### Pros
- All of the benefits of Level 1 and 2
- Complete development environment consistency across the team
- Everything is packaged with the project - the app runtime, its dependencies, any other required tools, etc.
- Includes the ability to specify IDE extensions to install with the project
- Debuggers and other tools work as expected

#### Cons

- Little to no customization available by developers/users - you get only what's bundled in the devcontainer environment
- Gaining access to host-specific configuration can be tricky. This might include things such as:
    - Docker-in-Docker scenarios are tricky to work with (eg, using Testcontainers), especially if registry credentials are required
    - Git credentials, especially if you are using a credential manager


## Contributing

This repo is intended to support examples for several sample stacks. I intend to add a few more examples over time, but it is not going to be an exhaustive list of all available options. If you want to contribute an example, open an issue first and let's chat!
