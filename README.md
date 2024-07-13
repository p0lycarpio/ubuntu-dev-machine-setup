# linux-dev-machine-setup

## Description

This repo contains Ansible playbooks to configure your system as a development machine upon a clean install.

The playbooks should run in Debian based systems (Ubuntu) and Fedora. It was tested with:
- **Ubuntu 22.04**
- **Fedora Workstation 39**

---

## What gets installed and configured?

Summary of packages that get installed and configured based on roles:

- **role: base**
  - disable system crash reports
  - upgrade all packages
  - install productivity tools
  - install development related packages (tools, SDKs)
  - install virtualization tools like virtualbox, docker, docker-compose
- **role: zsh**
  - install zsh package and set user shell to zsh
  - install antidote zsh plugin manager
  - restore zsh configuration files
  - install ohmyzsh/ohmyzsh and enable some bundled plugins
- **role: terminal_customizations**
  - download and install some nerd fonts from ryanoasis/nerd-fonts; these are mono fonts ideal for use in terminal or programming editors
- **role: vscode**
  - add Visual Studio Code repository
  - install Visual Studio Code
- **role: chrome**
  - add Google Chrome repository on ubuntu
  - install Google Chrome or Chromium
- **role: firefox (ubuntu)**
  - drop Firefox snap package
  - add Mozilla apt repository
  - install Firefox
- **role: hashicorp**
  - install vagrant, ~~terraform, packer~~

---

## Step 0 | Pre-requisites for running the ansible playbooks

On the system which you are going to setup using Ansible, perform these steps.

You need to install `ansible` and `git` before running the playbooks.

```bash
# Ubuntu
sudo apt update
sudo apt install git pipx -y

# Fedora
sudo dnf install pipx

# Install Ansible
pipx ensurepath
pipx install --include-deps ansible
```

## Step 1 | Basic setup

Clone this repo.

Install 3rd-party roles with :
```bash
ansible-galaxy install -r requirements.yml
```

## Step 2 | Running the playbooks to configure your system

**Invoke the following as yourself, the primary user of the system. Do not run as `root`.**

```bash
ansible-playbook main.yml -vv -e "local_username=$(id -un)" -K
```

Enter the sudo password when asked for `BECOME password:`.

The `main.yml` playbook will take anything from 15 minutes to an hour to complete.

---

## Known Issues

- If the ansible playbook halts after completing a few tasks, simply run the playbook again. Since most of the tasks are idempotent, running the playbook multiple times won't break anything.
- If your terminal shows any weird characters because of installing one of the zsh themes, simply change the font to a suitable Nerd Font from the terminal's settings.
