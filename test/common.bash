#!/usr/bin/env bats

# bats setup function
setup() {
  export XDG_CACHE_HOME="$(mktemp -d)"
}

# bats teardown function
teardown() {
  rm -rf "$XDG_CACHE_HOME"
}
