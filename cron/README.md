# CRON Jobs

This directory contains cron jobs. To add cron jobs, you'll need to run `crontab -e` in the terminal to add new items.

For daily jobs, add this entry:

```
0 0 * * * cd ~/dotfiles/cron && ./daily.sh
```

