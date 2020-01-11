#!/bin/bash
testestatus() {
  for adresse in $1
    do
      #echo Adresse: $adresse
      test=`/usr/sbin/i2cget -y 1 $adresse 0x00`
      if [ "$test" != "0x00" ]
        then
          log1=`date +"%Y-%m-%d_%T"`
          dest=/opt/fhem/log/i2cwatchdog-`date +%Y-%m`.log
          echo "$log1 $adresse $test" >> $dest
          /usr/sbin/i2cset -y 1 $adresse 0x00 0x00
          /usr/sbin/i2cset -y 1 $adresse 0x01 0x00
      fi
  done
}

testestatus "0x24 0x25 0x26 0x27"
