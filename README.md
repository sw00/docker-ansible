# Ansible in a Docker Container

## Usage

Entrypoint defaults to `ansible`. Simply execute it inside the container by appending arguments
to `docker run`.

```SHELL
$ docker run --rm sw00/ansible --version
ansible 2.2.1.0
  config file =
  configured module search path = Default w/o overrides
```

Override the Docker image's _entrypoint_ to execute other binaries such as `ansible-playbook`.

```SHELL
$ docker run --rm --entrypoint ansible-playbook sw00/ansible --version
ansible-playbook 2.2.1.0
  config file =
  configured module search path = Default w/o overrides
```


You can mount the current directory inside the container to utilise playbooks other files.

```SHELL
$ docker run --rm -v `pwd`:/workspace sw00/ansible all -i /workspace/hosts.ini -m ping
```

### Tip

Wrap the tedious commands in [shellscripts](https://github.com/sw00/docker-ansible/tree/master/bin) to make your life easier.

```SHELL
# ansible.sh
#!/bin/sh

docker run --rm -it -v `pwd`:/workspace sw00/ansible $@
```

Usage: `./ansible.sh all -i inventory.ini --list-hosts`


## Why?

Fed up with trying to install Ansible on OSX with `pip` because it fails
with the following error:

```SHELL
$ pip install -U ansible
...
    build/temp.macosx-10.11-x86_64-2.7/_openssl.c:434:10: fatal error: 'openssl/opensslv.h' file not found
    #include <openssl/opensslv.h>
             ^
    1 error generated.
    error: command 'clang' failed with exit status 1
```

Which leads to a whole saga of trying to get Homebrew to [link openssl](https://stackoverflow.com/questions/38670295/homebrew-refusing-to-link-openssl).

