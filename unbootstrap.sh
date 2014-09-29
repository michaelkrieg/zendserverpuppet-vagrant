#!/bin/sh
#Unbootstrap Zend Server if it was temporarily bootstrapped for the upgrade
. /etc/zce.rc
sqlite3 $ZCE_PREFIX/var/db/gui.db 'DELETE FROM GUI_USERS' && \
  sed -i 's/zend_gui.completed = true/zend_gui.completed = false/' $ZCE_PREFIX/gui/config/zs_ui.ini

