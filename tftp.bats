#! /usr/bin/env bash
# Functional tests for a tftp server
#
# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Variables
readonly read_file=README
readonly write_file=TEST

# Tests

@test 'It should be possible to read a file from tftp' {
  run tftp "${SUT_IP}" -c get "${read_file}"
  [ "${status}" -eq '0' ]
  [ -f "${read_file}" ]

  rm "${read_file}"
}

@test 'It should be possible to put a file on the tftp server' {
  printf 'Hello world!\n' > "${write_file}"

  tftp "${SUT_IP}" -c put "${write_file}"

  rm "${write_file}"
}
