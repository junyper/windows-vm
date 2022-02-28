# A Windows VM for A11y testing

Vagrant config for a Windows 10 VM with NVDA and Chrome installed for accessibility testing.

## Prerequisites
1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Install Vagrant](https://www.vagrantup.com/docs/installation)

## Usage
1. Run the `./download.sh` script to install the dependencies locally.
2. Run the `./createVM.sh` script to create the VM.
3. Open VirtualBox and start up the VM from the manager.

## Mac keyboards
NVDA uses the `Insert` key as a [special modifier key](https://www.nvaccess.org/files/nvdaTracAttachments/455/keycommands%20with%20laptop%20keyboard%20layout.html). If you are using a Mac keyboard with no `Insert` key, you might want to install software to map a different key to `Insert`, such as [Karabiner-Elements](https://karabiner-elements.pqrs.org/).