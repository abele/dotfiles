# -*- coding: utf-8 -*-
from invoke import task, run


@task
def install_vim_bundles():
    run('vim -u vim/bundles.vim +BundleInstall +q -c ":q"')


@task
def ack():
    home = '~'
    run('ln -s `pwd`/ack/ackrc {home}/.ackrc'.format(home=home))


@task
def pip():
    cp('pip/pip.cfg', '~/.pip')


def cp(source, destination):
    run('cp {} {}'.format(source, destination))
