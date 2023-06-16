import subprocess
from datetime import datetime
import time
time = str(datetime.now().time())
path = "/vagrant/bup_hour_db/"+time+"_bup_db.sql"

fichier = open(path,"w")
res = subprocess.Popen("mysqldump gitea",stdout=fichier, shell=True)
resu = res.communicate()
fichier.close()
res2 = subprocess.Popen("sudo scp -i /vagrant/data/backup_key -o 'StrictHostKeyChecking no' "+path+" root@192.168.4.110:/root/bup_db/bup_hour_db", shell=True)
resu2 = res2.communicate()
res3 = subprocess.Popen("rm "+path, shell=True)
resu3 = res3.communicate()

