#!/bin/bash

#
# Destroy Non-Vitals
#

# Remove Go Source
rm main.go
rm go.mod
rm -rf fundamentals

#
# Initialize Boilerplate
#

# Init main.go
cat << EOF > main.go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
EOF

# Init Go Module
go mod init go_sandbox

# Rewrite README
cat << EOF > README.md
# go_sandbox
sandbox:Go Programming and Turnkey Ecosystem

[Environment](#environment)
- [Configuration](#configuration)
- [Development](#development)
- [CI](#ci)
- [Production](#production)
- [Nuke](#nuke)

## Environment
### Development
#### Getting Started
Clone the repo
```sh
git clone git@github.com:permalik/go_sandbox.git
```

[Install Nix](https://nixos.org/download/)

Enter Nix shell
```sh
nix develop
```

#### Tooling
##### Format and Lint
Nix Format
```sh
alejandra <target>
```

Go Format
```sh
goimports -l -w <target>
```

Go Lint
```sh
golangci-lint run --fix --timeout=5m
```

##### Pre-Commit
Go formatter, linter, and various Pre-Commit hooks.

Initialize
```sh
# Run the root init script
sudo ./.precommit.sh
```

#### Testing
<!--TODO:-->

### Configuration
#### Shell
The root `.bashrc` will be sourced within the shell.
If changes are needed, update `.bashrc` and restart the shell with `nix develop`

### CI
GitHub Actions on Push and Pull Request using Ubuntu x86_64-Linux Self-Hosted Runner

### Production
```sh
# Restart Docker
orb restart docker

# Create image
docker build -t go_sandbox:dev .

# Build ephemeral container
docker run --rm go_sandbox:dev

# Destroy image
docker rmi go_sandbox:dev
```
EOF
