# \file install.py
#
# \brief Installs my development environment by configuring bash, 
# vim, and tmux
# 
# \author Jeffrey Bolin (JDB)
#
# \date Last edited December 2014
# 
# \note 
import os

os.system("mv .bashrc ~/")
os.system("mv .inputrc ~/")
os.system("mv .tmux.conf ~/")
os.system("mv .vimrc ~/")
os.system("mv .ycm_extra_conf.py ~/")
