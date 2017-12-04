# docker-ansible
Yet another Docker container to use as a replacement to your local ansible installation. 

This is a work in progress, see the Todo section below.

Based on the python:2.7.14 image.

## Getting started
1. Build the image.
```
docker build . -t docker-ansible
```
2. Create a useful alias command, note that the run command mounts the local directory relative from where you ran the ansible-docker-playbook alias command.
```
alias ansible-docker-playbook='docker container run -v $(pwd):/ansible --rm -it docker-ansible'
```
3. Run the example playbook i've created to test this.
```
ansible-docker-playbook -i hosts example-playbook.yml
```
4. Now just `cd` into your ansible playbook directory and run `ansible-docker-playbook`

## Todo
[X] Use a mount or volume to add your local ansible project to the container

[ ] Are python base image the slimmest way to do this? Probably not, investigate!

[ ] Add more advanced example with vault password files and encrypted yml files

[ ] Find a way to pass environment variables for proxies in a more dynamic way (?)

Enjoy!
