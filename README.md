Itamae is an open-source automation platform for Bourne shell script users.

## Scriptable over Configurable

Just configuring pre-defined variables for fixed behaviors is not powerful
enough.

In Itame, you have full control of both variables and behaviors.

Itame is just a collection of Bourne shell scripts. They are structured with
cookbooks, roles and nodes. You can overwrite variables and functions defined
in cookbooks and roles.

## Naming Rules

### Directory and file names
* The Itamae home directory ```${ITAMAE_HOME}``` is /root/itamae.
* Cookbook scipts are placed in ${ITAMAE_HOME}/cookbooks directory.
* Role scripts are placed in ${ITAMAE_HOME}/roles directory.
* Node scripts are placed in ${ITAMAE_HOME}/nodes directory.
* Node script must have the same file name as its hostname.

You can include cookbook and role scripts in role and node scripts.

### Variable and function names
* The variable and functions in cookbooks must have prefix of cookbook name followed with double underscores "${cookbook_name}__".
* The variable and functions in roles must have prefix "role__${role_name}__".

## How to run

### Running itamae at localhost

Just run ```${ITAMAE_HOME}/bin/itamae.sh``` with being the root user.
It runs the node script for your hostname.

### Running itamae at remote hosts

First time setup
* Configure hosts so that you can use ssh and rsync to remote hosts.
* Configure remote hosts so that you can use sudo. For example, add your user to wheel group and then add the config below to /etc/sudoers.

```
Defaults:%wheel !requiretty
%wheel ALL=(ALL) ALL, (root) NOPASSWD: /usr/bin/rsync, /root/itamae/bin/itamae.sh
```

Just run ```${ITAMAE_HOME}/bin/remote_itamae.sh host...``` at localhost.
It will run rsync to push cookbooks, roles and nodes to remote hosts,
then run the node script for each remote host with sudo.

## Idempotence

It is your responsibility for writing scripts so that they will not corrupt
your hosts when you run them multiple times.

## License
MIT license.
