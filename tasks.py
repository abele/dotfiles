# -*- coding: utf-8 -*-
from invoke import task, run


@task
def install_vim_bundles():
    run('vim -u bundles.vim +BundleInstall +q -c ":q"')
