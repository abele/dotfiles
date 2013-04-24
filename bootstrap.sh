#!/usr/bin/env bash
# Bootsrap dotfile environment dependencies.
#
# Example usage:
#     $ ./bootstrap.sh

set -e

VENV=venv

virtualenv --distribute -p python2.7 $VENV
$VENV/bin/pip install invoke
