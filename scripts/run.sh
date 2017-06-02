#!/bin/sh
set -xe

confd -onetime -backend env

(echo "1"; echo "1"; echo "1"; echo "1"; echo "1"; echo "1"; "\r\n"; cat) | python /tmp/setup.py

kill -9 $(ps -e | grep collectd | awk '{print $1}')

mv /opt/collectd-plugins/cloudwatch/config/whitelist-confd.conf /opt/collectd-plugins/cloudwatch/config/whitelist.conf
mv /opt/collectd-plugins/cloudwatch/config/plugin-confd.conf /opt/collectd-plugins/cloudwatch/config/plugin.conf

exec collectd -f

