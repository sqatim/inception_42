#!/bin/sh

rc-service telegraf start
rc-service influxdb start
/grafana/bin/grafana-server;