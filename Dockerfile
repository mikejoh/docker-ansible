FROM alpine:edge
MAINTAINER mikejoh
RUN apk add --no-cache \
    ca-certificates \
    python \
    ansible
WORKDIR /ansible
ENTRYPOINT ["ansible-playbook"]
