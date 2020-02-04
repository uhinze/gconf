_gconf_configs()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(gcloud config configurations list --format='value(name)')" -- $curr_arg ) );
}

complete -F _gconf_configs gconf
