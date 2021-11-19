#! /bin/sh

kubectl apply \
  -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml

kubectl patch deployment kubernetes-dashboard \
  -n kubernetes-dashboard \
  --type json \
  -p '[{ "op": "add", "path": "/spec/template/spec/containers/0/args/2", "value": "--token-ttl=0" }]'

kubectl apply -f templates/dashboard/sa/admin-user-serviceaccount.yaml

kubectl \
	-n kubernetes-dashboard \
	get secret "$(
	  kubectl \
		  -n kubernetes-dashboard \
		  get sa/admin-user \
		  -o jsonpath="{.secrets[0].name}"
  )" \
  -o go-template="{{.data.token | base64decode}}" \
	&& echo ''
