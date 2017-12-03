# docker-ansible
Yet another Docker container to use as a replacement to your local ansible installation. Based on the python:2.7.14 image.

## Getting started
1. Build the image.
```
docker build . -t docker-ansible
```
2. Create a useful alias command.
```
alias ansible-docker-playbook="docker run --rm -it docker-ansible"
```
3. Run the example playbook i've created to test this
```
ansible-docker-playbook -i hosts example-playbook.yml
```

## Todo
* Use a mount or volume to add your local ansible project to the container
* Are python base image the slimmest way to do this? Probably not, investigate!
* Add more advanced example with vault password files and encrypted yml files

Enjoy!
