import subprocess
from datetime import datetime
import time

time = str(datetime.now().date())
path = "/vagrant/bup_day_db_web/"+time+"_bup_db_web.sql"

fichier = open(path,"w")
res = subprocess.Popen("mysqldump wordp",stdout=fichier, shell=True)
resu = res.communicate()
fichier.close()
res2 = subprocess.Popen("sudo scp -i /vagrant/data/backup_key -o 'StrictHostKeyChecking no' "+path+" root@192.168.4.110:/root/bup_db_web/bup_day_db_web", shell=True)
resu2 = res2.communicate()

