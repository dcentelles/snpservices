#!/bin/bash

echo "~~~~ START ~~~~ $(date '+\%Y-\%m-\%d \%H:\%M:\%S')" >> /var/log/snpservices/mrtg.log 2>&1
if [ ! -x /var/lock/mrtg ]
then
	mkdir /var/lock/mrtg
fi
if [ -x /usr/bin/mrtg ] && [ -r /var/www/html/snpservices/data/mrtg.cfg ]
then
	env LANG=C /usr/bin/mrtg /var/www/html/snpservices/data/mrtg.cfg --lock-file /var/lock/mrtg/guifi_l >> /var/log/snpservices/mrtg.log 2>&1
fi
echo "~~~~ END ~~~~ $(date '+\%Y-\%m-\%d \%H:\%M:\%S')" >> /var/log/snpservices/mrtg.log 2>&1
