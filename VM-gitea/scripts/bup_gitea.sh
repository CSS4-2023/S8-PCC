echo "Script python"
mkdir /bash
cp /vagrant/bash/bup_hour_gitea.sh /bash/bup_hour_gitea.sh
cp /vagrant/bash/bup_day_gitea.sh /bash/bup_day_gitea.sh
echo "*/20 * * * * bash /bash/bup_hour_gitea.sh
* * */1 * * bash /bash/bup_day_gitea.sh" | crontab -
