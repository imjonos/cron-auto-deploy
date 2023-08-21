#!/bin/bash
source ./deploy.conf

echo ">>>>>> SERVER DEPLOY <<<<<<"
    echo "cd $path"
    cd "$path"
    echo "git fetch origin $branch"
    git fetch origin "$branch"

    UPSTREAM=${1:-'@{u}'}
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse "$UPSTREAM")
    BASE=$(git merge-base @ "$UPSTREAM")

    if [ $LOCAL = $REMOTE ]; then
        echo "Your branch is up to date"
    elif [ $LOCAL = $BASE ]; then
        echo "Need to pull"
	git clean  -d  -f .
	git stash
	git pull origin "$branch"
	git stash drop

        #CUSTOM ACTIONS
	#php artisan migrate
        curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"$path $branch deployed\"}" "$discord_webhook_url"  > /dev/null
    fi
echo ">>>>>> DONE <<<<<<"