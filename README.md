# docker-ansible
Yet another Docker container to use as a replacement to your local ansible installation. 

This is a work in progress, see the Todo section below.

Based on the `alpine:edge` image.

## Getting started
1. Build the image.
```
docker build . -t docker-ansible
```
or pull the image from Docker Hub
```
docker pull mikejoh/docker-ansible
```
2. Create a useful alias command, note that the run command mounts the local directory relative from where you ran the ansible-docker-playbook alias command. Add the alias to your shell profile/rc-file to make the alias command persistent.
```
alias ansible-docker-playbook='docker container run -v $(pwd):/ansible --rm -it docker-ansible'
```
or if you're using a vault password file anywhere in your ansible projects:
```
alias ansible-docker-playbook='docker container run -v $(pwd):/ansible -v ~/.vault_pass.txt:/home/ansible/.vault_pass.txt --rm -it docker-ansible'
```
3. Run the example playbook i've created to test this.
```
ansible-docker-playbook -i hosts example-playbook.yml
```
4. Now just `cd` into your ansible playbook directory and run `ansible-docker-playbook`

## Notes

* In this example the `.vault_pass.txt` will be configured as default via `ansible.cfg`, this means that when you encrypt a file with `ansible-vault encrypt` the passphrase contained within the `~/.vault_pass.txt` file would be used.

Enjoy!
