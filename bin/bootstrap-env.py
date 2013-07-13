#!/usr/bin/env python2
# -*- coding: utf-8 -*-
import sys
import subprocess

VENV_VERSION = '1.9.1'
PYPI_VENV_BASE = 'https://pypi.python.org/packages/source/v/virtualenv/'


def shellcmd(cmd, echo=True):
    """ Run 'cmd' in the shell and return its standard out."""
    if echo:
        print('[cmd] {0}'.format(cmd))

    out = subprocess.check_output(cmd, stderr=sys.stderr, shell=True)

    if echo:
        print(out)

    return out


def main(initial_env='venv', python='python2'):
    dirname = 'virtualenv-' + VENV_VERSION
    tgz_file = dirname + '.tar.gz'

    # Fetch virtualenv from PyPI
    venv_url = PYPI_VENV_BASE + '/' + tgz_file
    shellcmd('wget {0}'.format(venv_url))

    # Untar
    shellcmd('tar xzf {0}'.format(tgz_file))

    # Create the initial env
    shellcmd('{0} {1}/virtualenv.py --distribute {2}'.format(
        python, dirname, initial_env))

    # Install the virtualenv package itself into the initial env
    shellcmd('{0}/bin/pip install {1}'.format(initial_env, tgz_file))

    # Cleanup
    shellcmd('rm -rf {0} {1}'.format(dirname, tgz_file))


if __name__ == '__main__':
    main()
