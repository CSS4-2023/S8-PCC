import requests
import socket
import psutil

cpu_count = psutil.cpu_count(logical=False)

memory = psutil.virtual_memory()
memory_total = int(memory.total / (1024*1024))

disk = psutil.disk_usage('/')
disk_total = int(disk.total / (1024 * 1024 * 1024)) 
hostname = socket.gethostname()

api_url = "http://Netbox.e4.sirt.tp/api/virtualization/virtual-machines/"

headers = {
    "Authorization": "Token 29042f325a3411e372c6f7ca5512e65ae4089592",
    "Content-Type": "application/json",
}

# Données de la VM à ajouter
data = {
    "name": hostname,
    "cluster": 2,  #BDD  Admin DMZ  Management Web
    "status": "active",  # Statut de la VM
    "vcpus": cpu_count,
    "memory": memory_total,
    "disk": disk_total, 
    # Autres attributs de la VM...
}

response = requests.post(api_url, headers=headers, json=data)

if response.status_code == 201:
    print("VM ajoutée avec succès à NetBox !")
else:
    print("Erreur lors de l'ajout de la VM à NetBox :", response.text)
