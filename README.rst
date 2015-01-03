dotfiles
========

:Author: Jānis Ābele <janis.abele@gmail.com>

Authors preferred home setup for Linux.

Description
-----------

`dotfiles` are easy to setup configuration for Linux workstation.

Install
-------

Clone onto your workstation:

  git clone git://github.com/abele/dotfiles.git

Install rcm_:

  sudo emerge layman
  sudo layman -f --overlays
  https://github.com/bronislav/overlays/raw/master/layman.xml --add bronislav
  sudo emerge rcm

Install the dotfiles:

  env RCRC=$HOME/dotfiles/rcrc rcup

This command will create symlinks for config files in your home directory.
Setting the RCRC environment variable tells rcup to use standard configuration
options::

  - Exclude the README.md and LICENSE files, which are part of the dotfiles
    repository but do not need to be symlinked in.
  - Give precedence to personal overrides which by default are placed in
    ~/dotfiles-local

You can safely run rcup multiple times to update:

  rcup

Credits
-------
Ripping of `thoughtbot dotfiles`_.

.. _rcm: https://github.com/thoughtbot/rcm
.. _thoughtbot dotfiles: https://github.com/thoughtbot/dotfiles
