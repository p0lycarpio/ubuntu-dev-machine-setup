# ubuntu-dev-machine-setup | Ubuntu 22.04

## Description

This repo contains Ansible playbooks to configure your system as a development machine upon a clean install.

The playbooks should run in Debian based system but was only tested with:
- **Ubuntu 22.04**
- **Pop!_OS 22.04**

For other versions of Ubuntu, change to the other branches of this git repo. Other versions include Ubuntu 18.04 LTS and 20.04 LTS.

---

## What gets installed and configured?

Summary of packages that get installed and configured based on roles:

- **role: base**
  - mount `/tmp` on tmpfs (reduce SSD read writes and increase SSD lifespan; no leftover files on system shutdown)
  - disable system crash reports
  - tune system swappiness so that swapping is greatly reduced
  - upgrade all packages
  - install productivity tools
  - install development related packages (tools, SDKs)
  - install virtualization tools like virtualbox, docker, docker-compose
  - install and configure ssh server
- **role: zsh**
  - install zsh package and set user shell to zsh
  - ~~install antigen zsh plugin manager~~
  - ~~copy and enable sample `~/.zshrc` file if one does not exist~~
  - install ohmyzsh/ohmyzsh and enable some bundled plugins
- **role: terminal_customizations**
  - download and install some nerd fonts from ryanoasis/nerd-fonts; these are mono fonts ideal for use in terminal or programming editors
- **role: vscode**
  - add Visual Studio Code apt repo
  - install Visual Studio Code
  - ~~install some popular Visual Studio Code extensions~~
- **role: googlechrome**
  - add Google Chrome apt repo
  - install Google Chrome
- **role: hashicorp**
  - install vagrant, ~~terraform, packer~~

---

## Step 0 | Pre-requisites for running the ansible playbooks

On the system which you are going to setup using Ansible, perform these steps.

You need to install `ansible` and `git` before running the playbooks.

```bash
/usr/bin/sudo apt update
/usr/bin/sudo apt install ansible git -y
```

### Ansible

To verify whether pip is already installed for your preferred Python:

```bash
$ python3 -m pip -V
pip 21.0.1 from /usr/lib/python3.9/site-packages/pip (python 3.9)
```

Install Ansible and ansible-lint :

```bash
python3 -m pip install --user ansible ansible-lint
```

## Step 1 | Basic setup

Clone this repo (do not clone in `/tmp` as this dir is cleaned and mounted in tmpfs)

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
- If you do not like the fuzzy finder completions in your terminal, remove or comment out the `#fzf` lines in your `~/.zshrc` (this is not a known issue but a feature)
