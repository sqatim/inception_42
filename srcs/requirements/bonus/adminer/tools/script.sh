#!/bin/sh

rc-service telegraf start
exec php -S 0.0.0.0:6060