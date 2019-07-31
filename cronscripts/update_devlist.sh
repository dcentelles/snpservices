#!/bin/bash

if [ -x /var/www/html/snpservices/graphs ]
then 
	cd /var/www/html/snpservices/graphs
	echo "~~~~ START ~~~~ $(date '+\%Y-\%m-\%d \%H:\%M:\%S')" >> /var/log/snpservices/mrtgccfg.log 2>&1

	wget -O ../data/cnml/poblatornesa.cnml https://guifi.net/ca/guifi/cnml/20887/detail >> /var/log/snpservices/mrtgccfg.log 2>&1
	wget -O ../data/cnml/castellodelaplana.cnml https://guifi.net/ca/guifi/cnml/11275/detail >> /var/log/snpservices/mrtgccfg.log 2>&1

fi
if [ -x /usr/bin/php ] && [ -r /var/www/html/snpservices/graphs/mrtgcsv2mrtgcfg.php ]
then env LANG=C /usr/bin/php mrtgcsv2mrtgcfg.php >> /var/log/snpservices/mrtgccfg.log 2>&1
	echo "~~~~ END ~~~~ $(date '+\%Y-\%m-\%d \%H:\%M:\%S')" >> /var/log/snpservices/mrtgccfg.log 2>&1
	echo "Interval: 10" >> ../data/mrtg.cfg
fi

