#!/bin/bash

if [ ! -x /var/lock/mrtg ]
then
	mkdir /var/lock/mrtg
fi
if [ -x /usr/bin/mrtg ] && [ -r /var/www/html/snpservices/data/mrtg.cfg ]
then
	echo "~~~~ START ~~~~ $(date '+\%Y-\%m-\%d \%H:\%M:\%S')" >> /var/log/snpservices/mrtg.log 2>&1
	env LANG=C /usr/bin/mrtg /var/www/html/snpservices/data/mrtg.cfg --lock-file /var/lock/mrtg/guifi_l >> /var/log/snpservices/mrtg.log 2>&1
	echo "~~~~ END ~~~~ $(date '+\%Y-\%m-\%d \%H:\%M:\%S')" >> /var/log/snpservices/mrtg.log 2>&1
fi


