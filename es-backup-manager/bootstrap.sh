#!/bin/sh
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

curl -X PUT "elasticsearch:9200/_slm/policy/daily-snapshots"  --connect-timeout 30 \
    --retry-delay 5 --retry 300 \
    -H 'Content-Type: application/json' \
    --data-binary @- << EOF
{
  "schedule": "0 30 1 * * ?", 
  "name": "<daily-snap-{now/d}>", 
  "repository": "backup", 
  "config": { 
    "indices": ["data-*", "important"], 
    "ignore_unavailable": false,
    "include_global_state": false
  },
  "retention": { 
    "expire_after": "30d", 
    "min_count": 5, 
    "max_count": 50 
  }
}
EOF




