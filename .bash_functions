function ansible() {
  docker run --rm -v ${PWD}:/data -v ${HOME}/.ssh:/home/ansible/.ssh -v ${SSH_AUTH_SOCK}:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent -e USER=ansible cytopia/ansible:latest ansible-playbook
}

function ansible-playbook() {
  docker run --rm -v ${PWD}:/data -v ${HOME}/.ssh:/home/ansible/.ssh -v ${SSH_AUTH_SOCK}:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent -e USER=ansible cytopia/ansible:latest ansible-playbook
}

function mongosh() {
  docker run -v ${PWD}:/root --network=host -it --rm mongo:4.2.24-bionic mongo $@
}