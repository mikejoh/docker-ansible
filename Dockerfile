FROM python:2.7.14
MAINTAINER mikejoh
RUN pip install ansible
ADD ansible/ ansible/
WORKDIR /ansible
ENTRYPOINT ["ansible-playbook"]
