#!/usr/bin/env bash

# globals
meda_dir='.meda'
refs_dir="${meda_dir}/refs"
content_dir="${meda_dir}/content"

# funcs
walk_fs() {
  # recursively walk file system
  # TODO
  :
}

create_repo_dirs() {
  # create dirs for repo
  mkdir -p "$1/${refs_dir}" && mkdir -p "$1/${content_dir}" || exit
}

reinitialize() {
  # delete refs/content
  rm -rf "${1:?}/${refs_dir}" && rm -rf "${1:?}/${content_dir}"

  # recreate dirs
  create_repo_dirs "$1"
}

create_repo() {
  # check existing .meda repo
  repo_exists "$1"

  # create
  create_repo_dirs "$1"
  echo "New meda repo initialized ..."
}

repo_exists(){
  # check for .meda repo
  if [[ -d "$1/${meda_dir}" ]]; then
    # ask what to do
    answer=
    echo -n "Meda repo already exists. Reinitialize? [Y/n]: "
    read answer

    # check answer
    case "$answer" in
      Y) reinitialize "$1"; exit ;;
      *) exit ;;
    esac

  # check for nested .meda repo
  elif [[ "$1" = *"${meda_dir}"* ]]; then
    echo "Cannot nest meda repos" && exit
  fi
}

print_refs() {
  # print out refs to files in project tree
  # TODO
  :
}

meda_init() {
  # check if .meda repo exists
  if [[ -z "$1" ]]; then
    create_repo "$PWD"
  else
    create_repo "$1"
  fi
}

meda_add() {
  # need to sanitize ref argument
  # TODO
  local path
  path="$1"

  # hash sanitized ref path
  local ref_hash
  ref_hash="$(echo "${path}" | shasum)"

  # check if file exists
  # TODO
  echo "${ref_hash}"
}


# main interface
if [ -z "$1" ]; then
  print_refs
else
  case "$1" in
    add) meda_add "$2" ;;
    init) meda_init "$2" ;;
  esac
fi
