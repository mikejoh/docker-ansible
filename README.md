# docker-ansible
Yet another Docker container to use as a replacement to your local ansible installation. 

This is a work in progress, see the Todo section below.

Based on the ~~`python:2.7.14`~~ `alpine:edge` image (~757MB vs. ~97MB).

## Getting started
1. Build the image.
```
docker build . -t docker-ansible
```
2. Create a useful alias command, note that the run command mounts the local directory relative from where you ran the ansible-docker-playbook alias command. Add the alias to your shell profile/rc-file to make the alias command persistent.
```
alias ansible-docker-playbook='docker container run -v $(pwd):/ansible --rm -it docker-ansible'
```
3. Run the example playbook i've created to test this.
```
ansible-docker-playbook -i hosts example-playbook.yml
```
4. Now just `cd` into your ansible playbook directory and run `ansible-docker-playbook`

## Notes

* Regarding Ansible Vault and your own projects, you could add the following `-v ~/.vault_pass.txt:/root/.vault_pass.txt` to the Docker run command above. This would make your vault password file accessible within the container, but via the home directory of `root`. We should not run ansible as root within the container!
* In this example the `.vault_pass.txt` will be configured as default via `ansible.cfg`, this means that when you encrypt a file with `ansible-vault encrypt` the passphrase contained within the `~/.vault_pass.txt` file would be used.

## Todo
[X] Use a mount or volume to add your local ansible project to the container

[X] Are python base image the slimmest way to do this? Probably not, investigate!

[ ] Run ansible as a non-root user

[ ] Add more advanced example with vault password files and encrypted yml files

[ ] Find a way to pass environment variables for proxies in a more dynamic way (?)

Enjoy!
