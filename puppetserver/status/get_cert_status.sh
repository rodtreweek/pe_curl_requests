#!/bin/bash

   SET_SERVER=$(puppet config print ca_name | sed 's/^.*\s//')
   CA="${CA:-$SET_SERVER}"
   NODE='pe-201645-agent-win2012'

   curl -X GET -H "Content-Type: application/json" \
     --cert $(puppet config print hostcert) \
     --key $(puppet config print hostprivkey) \
     --cacert $(puppet config print localcacert) \
     https://${CA}:8140/puppet-ca/v1/certificate_status/${NODE}?environment=production
