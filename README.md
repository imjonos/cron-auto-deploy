# Cron auto-deploy
Simple sh script for auto deploy with Discord notifications.<br>

## How to use
``` bash
$ cp deploy.conf.example deploy.conf
```
``` bash
$ crontab -e
```
``` bash
*/5 * * * * cd /home/user/project && ./deploy.sh >> /home/user/project/deploy.log 2>&1
```
Enjoy! <br>
