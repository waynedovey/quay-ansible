#!/bin/bash

openssl genrsa -des3 -out CA-ocp4.gsslab.brq.redhat.com.key 2048


openssl req -x509 -new -nodes -key CA-ocp4.gsslab.brq.redhat.com.key -sha256 -days 1825 -out CA-ocp4.gsslab.brq.redhat.com.pem


openssl genrsa -out quay.ocp4.gsslab.brq.redhat.com.key 2048


openssl req -new -key quay.ocp4.gsslab.brq.redhat.com.key -out quay.ocp4.gsslab.brq.redhat.com.csr

openssl x509 -req -in quay.ocp4.gsslab.brq.redhat.com.csr -CA CA-ocp4.gsslab.brq.redhat.com.pem -CAkey CA-ocp4.gsslab.brq.redhat.com.key -CAcreateserial -out quay.ocp4.gsslab.brq.redhat.com.crt -days 1825 -sha256
