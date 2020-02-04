#compdef _gconf gconf

all_configs="($(gcloud config configurations list --format='value(name)'))"

_describe 'configs' $all_configs
