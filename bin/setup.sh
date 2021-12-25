#! /bin/sh

MODE=$1

./bin/gcr-auth.sh ../../etc/build-gcp-key.json ihsw.aparker.kilabuk@gmail.com \
  && ./bin/set-bnet-credentials.sh \
  && ./bin/apply-template.sh -t influxdb -m "$MODE" -a \
  && ./bin/apply-template.sh -t telegraf -m "base" -a \
  && ./bin/apply-template.sh -t grafana -m "$MODE" -a \
  && ./bin/apply-template.sh -t nats -m "base" -a \
  && ./bin/apply-template.sh -t postgresql -m "$MODE" -a \
  && ./bin/apply-template.sh -t sotah-server-pvc -m "$MODE" -a \
  && ./bin/apply-template.sh -t sotah-server-api -m "base" -a \
  && ./bin/apply-template.sh -t sotah-api -m "$MODE" -a \
  && ./bin/apply-template.sh -t sotah-ui -m "base" -a
