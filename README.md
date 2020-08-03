Install Gems:

```
bundle install
```

Run migrations:
```
rake db:migrate
```

Copy `config/data_urls.yml.example` to `config/data_urls.yml` and set correnc urls

Init cron jobs:
```
whenever --update-crontab
```

Start delayed jobs:
```
RAILS_ENV=development bin/delayed_job start
```

Start rails server
```
rails c
```

Open http://localhost:3000
