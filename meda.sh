#!/usr/bin/env bash

# globals
refs_dir='.meda/refs'
content_dir='.meda/content'

# funcs
walk_fs() {
  # recursively walk file system
  # TODO
  :
}

repo_exists(){
  # check for .meda repo
  # TODO
  :
}

print_refs() {
  # print out refs to files in project tree
  # TODO
  :
}

meda_init() {
  # check if .meda repo exists
  # TODO

  # check if arg 2 is a dir
  # TODO

  # create
  mkdir -p "${refs_dir}" && mkdir -p "${content_dir}" || exit
}


# main interface
if [ -z "$1" ]; then
  print_refs
else
  case "$1" in
    add) : ;;
    init) meda_init "$2" ;;
  esac
fi
