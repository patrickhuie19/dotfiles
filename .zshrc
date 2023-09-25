# must go after exec tmux?
start_tmux() {
  # Rename terminal tab
  BASEDIR=${PWD##*/}
  BASEDIR=${BASEDIR:-/}
  echo -e "\033]0;$BASEDIR\007"

  # If not already in a tmux session, attach to an existing one or create a new one
  if [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then
    tmux attach-session -t my-session || tmux new-session -s my-session
  fi

  echo -e "\033]0;$BASEDIR\007"

  # best we can do for now since Apple has trouble uniquely identifying a terminal tab
  alias exitkill='tmux kill-session -t $(tmux display-message -p "#S") && exit'
}

eval "$(zoxide init zsh)"
start_tmux


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export GOPATH=/Users/patrick.huie@smartcontract.com/go
export PATH=/Users/patrick.huie@smartcontract.com/.nvm/versions/node/v16.20.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/go/bin:/Users/patrick.huie@smartcontract.com/go/bin

export HISTORY_IGNORE="(access_token|accesstoken|AKIA|api_key|apikey|authonly|authorization|aws_access_key_id|aws_secret_access_key|bearer|client-secret|client_secret|current_key|eyjrijoi|gh_token|github_token|hooks.slack.com|id-token|id_token|kubectl --token=|kubectl config set-credentials|pagerduty_|password|private_key|private_key_id|read|refresh-token|refresh_token|refreshtoken|token|x-api-key|x-auth-key)"

