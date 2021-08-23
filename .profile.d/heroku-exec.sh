# This is needed because https://devcenter.heroku.com/articles/exec#using-with-docker

[ -z "$SSH_CLIENT" ] && source <(curl --fail --retry 3 -sSL "$HEROKU_EXEC_URL")
