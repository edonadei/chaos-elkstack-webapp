# First we have to create a backup directory (repository)
```
PUT /_snapshot/backup
{
  "type": "fs",
  "settings": {
    "location": "/opt/elasticsearch/backup"
  }
}
```

# Then we can create the cron job for backup
```
PUT /_slm/policy/daily-snapshots
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
```