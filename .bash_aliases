alias vpnon="protonvpn-cli c --fastest"
alias vpnoff="protonvpn-cli d"
alias vpnstatus="protonvpn-cli s"
alias internetinfo="node ~/projects/personal/nauta-cli/src/index user-info"
alias interneton="node ~/projects/personal/nauta-cli/src/index.js connect --force && protonvpn-cli c --fastest"
alias internetoff="protonvpn-cli d ; node ~/projects/personal/nauta-cli/src/index.js disconnect"
alias artisan="php artisan"

# Print public IP. 
# From https://www.howtogeek.com/839170/how-to-get-your-public-ip-in-a-linux-bash-script/
alias myip="dig @resolver1.opendns.com myip.opendns.com +short"

# Google Cloud CLI using Docker
alias gcloud="docker run --rm -it -v ~/.config/gcloud:/root/.config/gcloud --name gcloud-cli gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine gcloud"

# Set vi && vim to nvim
alias vim=nvim
alias vi=nvim
