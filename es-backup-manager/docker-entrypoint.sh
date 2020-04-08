#!/bin/bash
# We try again and again to add

curl -X PUT "elasticsearch:9200/_snapshot/my_backup?pretty"  --connect-timeout 30 \
    --retry-delay 5 --retry 300 \
    -H 'Content-Type: application/json' \
    --data-binary @- << EOF
{
  "type": "fs",
  "settings": {
    "location": "/opt/elasticsearch/backup"
  }
}
EOF


