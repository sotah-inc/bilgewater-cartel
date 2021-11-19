#! /bin/sh

APPLY=''
DELETE=''
TEMPLATE=''
MODE=''

while getopts 'adt:m:' flag; do
  case "${flag}" in
    a) APPLY='true' ;;
    d) DELETE='true' ;;
    t) TEMPLATE="$OPTARG" ;;
    m) MODE="$OPTARG" ;;
    *) exit 1 ;;
  esac
done

OUTPUT=$(kubectl kustomize ./templates/"$TEMPLATE"/"$MODE")

if [ -n "$APPLY" ]
then
  echo "$OUTPUT" | kubectl apply -f -

  exit 0
fi

if [ -n "$DELETE" ]
then
  echo "$OUTPUT" | kubectl delete -f -

  exit 0
fi

echo "$OUTPUT"
