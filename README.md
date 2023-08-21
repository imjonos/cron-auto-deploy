# Cron auto-deploy
Simple sh script for auto deploy with Discord notifications.<br>

## How to use 
cp deploy.conf.example deploy.conf <br>
crontab -e <br>
*/5 * * * * cd /home/user/project && ./deploy.sh >> /home/deploy.log 2>&1 <br>
Enjoy! <br>
