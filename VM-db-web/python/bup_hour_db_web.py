import subprocess
import time
from datetime import datetime

time = str(datetime.now().time())
path = "/vagrant/bup_hour_db_web/"+time+"_bup_db_web.sql"

fichier = open(path,"w")
res = subprocess.Popen("mysqldump wordp",stdout=fichier, shell=True)
resu = res.communicate()
res2 = subprocess.Popen("sudo scp -i /vagrant/data/backup_key -o 'StrictHostKeyChecking no' "+path+" root@192.168.4.110:/root/bup_db_web/bup_hour_db_web", shell=True)
resu2 = res2.communicate()
res3 = subprocess.Popen("rm "+path, shell=True)
resu3 = res3.communicate()


