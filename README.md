# Exercism Workspace
Utilizing [Nix](https://nix.dev/), [devenv](https://devenv.sh/) and
[direnv](https://direnv.net/) in order to provide shells with all the tools needed to
complete [Exercism exercises](https://exercism.org/).

This is currently my workspace so it also includes my solutions. At some point I might
extract out the common parts and leave the workspace empty to have a clean starting point.

## Usage
Configure [Exercism](https://exercism.org/).
```sh
exercism-workspace-init
```

Download the exercise you want to work on:
```sh
exercism download --exercise=hello-world --track=bash
```

Enter the directory of the exercise to enter the shell:
```sh
cd bash/hello-world
exercism version 3.2.0
GNU bash, version 5.2.15(1)-release (x86_64-pc-linux-gnu)
Bats 1.10.0

Run the tests with:
bats *.bats
```

Run the tests according to the instructions.

Iterate on exercise until tests pass.

Submit exercise:
```sh
exercism submit bash/hello-world/hello_world.sh
```
