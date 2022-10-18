# CRON Jobs

To add cron jobs, you'll need to run `crontab -e` in the terminal to add new items.

For daily jobs, add this entry:

```
0 0 * * * cron-daily
```

## Cron scripts

All executable files live in `~/dotfiles/bin/.local/bin/` and are symlinked to a `~/.local/bin` directory which resides in my `$PATH`. It's best to follow the convention of naming files `cron-{interval}` to make it easy.

