## Environment variables

```
heroku addons:create scheduler:standard
heroku addons:create redistogo:nano

heroku config:set HUBOT_SLACK_TOKEN=
heroku config:set HUBOT_ADAPTER=slack
heroku config:set HUBOT_GOOGLE_IMAGES_FALLBACK=
heroku config:set HUBOT_GOOGLE_CSE_ID=
heroku config:set HUBOT_GOOGLE_CSE_KEY=
heroku config:set HUBOT_HEROKU_KEEPALIVE_URL= # - required, the complete URL to keepalive, including a trailing slash.
heroku config:set HUBOT_HEROKU_WAKEUP_TIME= # - optional, the time of day (HH:MM) when hubot should wake up. Default: 6:00 (6 am)
heroku config:set HUBOT_HEROKU_SLEEP_TIME= # - optional, the time of day (HH:MM) when hubot should go to sleep. Default: 22:00 (10 pm)
heroku config:set HUBOT_HEROKU_KEEPALIVE_INTERVAL= # - the interval in which to keepalive, in minutes. Default: 5
```