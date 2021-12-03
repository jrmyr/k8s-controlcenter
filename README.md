# Kubernetes control center

A flexible and powerful [kubernetes](https://kubernetes.io/) templating based on [ytt](https://carvel.dev/ytt/).

## Requirements

### Install ytt
Visit the [ytt install page](https://carvel.dev/ytt/docs/latest/install/) and follow the install instructions for your system.

### Recommended tooling
For a comfortable editing use VS Code with these plugins:
  * vscode-ytt
  * vscode-starlark

## Usage

Execute `./generate_all_yamls.sh` to (re-)generate all YAML files containing the [kubernetes](https://kubernetes.io/) resources to be applied to the cluster.
