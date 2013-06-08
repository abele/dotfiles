#!/usr/bin/env bash
# Bootsrap dotfile environment dependencies.
#
# Example usage:
#     $ ./bootstrap.sh

set -e

VENV=venv

./bin/bootstrap-env.py $VENV
$VENV/bin/pip install invoke
