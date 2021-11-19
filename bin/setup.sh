#! /bin/sh

MODE=$1

./bin/apply-template.sh -t influxdb -m "$MODE" -a \
  && ./bin/apply-template.sh -t telegraf -m "base" -a \
  && ./bin/apply-template.sh -t grafana -m "$MODE" -a \
  && ./bin/apply-template.sh -t nats -m "base" -a \
  && ./bin/apply-template.sh -t postgresql -m "$MODE" -a \
  && ./bin/apply-template.sh -t sotah-server -m "$MODE" -a \
  && ./bin/apply-template.sh -t sotah-api -m "base" -a \
  && ./bin/apply-template.sh -t sotah-ui -m "base" -a
