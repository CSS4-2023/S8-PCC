echo "Script python"
mkdir /python
cp /vagrant/python/bup_hour_db_web.py /python/bup_hour_db.py
cp /vagrant/python/bup_day_db_web.py /python/bup_day_db.py
echo "*/10 * * * * python3 /python/bup_hour_db.py
* * */1 * * python3 /python/bup_day_db.py" | crontab -
