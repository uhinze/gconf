#!/usr/bin/env bats

COMMAND="$BATS_TEST_DIRNAME/../gconf"
export GCLOUD="$BATS_TEST_DIRNAME/../test/mock-gcloud"

load common

@test "--help should not fail" {
  run ${COMMAND} --help
  echo "$output"
  [ "$status" -eq 0 ]
}

@test "-h should not fail" {
  run ${COMMAND} -h
  echo "$output"
  [ "$status" -eq 0 ]
}

@test "list configs" {
  run ${COMMAND}
  echo "$output"
  [[ "$status" -eq 0 ]]
  [[ "$output" = *"config1"* ]]
  [[ "$output" = *"config2"* ]]
}

@test "switch to existing config" {
  run ${COMMAND} "config1"
  echo "$output"
  [[ "$status" -eq 0 ]]
  [[ "$output" = *'Activated [config1].'* ]]
}

@test "switch to non-existing config" {
  run ${COMMAND} "unknown-config"
  echo "$output"
  [[ "$status" -eq 1 ]]
  [[ "$output" = *'Cannot activate configuration [unknown-config], it does not exist.'* ]]
}

@test "switch between configs" {
  run ${COMMAND} config1
  echo "$output"
  [[ "$status" -eq 0 ]]
  [[ "$output" = *'Activated [config1].'* ]]

  run ${COMMAND} config2
  echo "$output"
  [[ "$status" -eq 0 ]]
  [[ "$output" = *'Activated [config2].'* ]]

  run ${COMMAND} -
  echo "$output"
  [[ "$status" -eq 0 ]]
  [[ "$output" = *'Activated [config1].'* ]]

  run ${COMMAND} -
  echo "$output"
  echo "$status"
  [[ "$status" -eq 0 ]]
  [[ "$output" = *'Activated [config2].'* ]]
}

@test "switch to previous config when none exists" {
  run ${COMMAND} -
  echo "$output"
  [[ "$status" -eq 1 ]]
  [[ "$output" = *"No previous config found"* ]]
}