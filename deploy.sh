#! /usr/bin/bash

# install and configure opam
apt-get install --assume-yes opam

opam init -y

eval "$(opam env)"

# install transitive dependencies
apt-get install --assume-yes --no-install-recommends libev-dev libssl-dev pkg-config

# install Dune and application dependencies
opam install dune tyxml dream dream-htmx

# build the executable
opam exec -- dune build

exe="./_build/default/bin/main.exe"

# run the executable
if [[ -x $exe ]]; then
    ./_build/default/bin/main.exe
fi