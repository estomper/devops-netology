terraform init
terraform plan
terraform apply
terraform validate
terraform destroy

yc compute instance list
+----------------------+--------+---------------+---------+---------------+-------------+
|          ID          |  NAME  |    ZONE ID    | STATUS  |  EXTERNAL IP  | INTERNAL IP |
+----------------------+--------+---------------+---------+---------------+-------------+
| fhm4shib704t9jjtp26h | node03 | ru-central1-a | RUNNING | 51.250.84.235 | 10.128.0.17 |
| fhmc10tg3v7sotukj4gi | node01 | ru-central1-a | RUNNING | 62.84.125.143 | 10.128.0.33 |
| fhmeg664smqtqlphdr18 | master | ru-central1-a | RUNNING | 51.250.87.234 | 10.128.0.34 |
| fhmjcktov9id29mfolhi | node04 | ru-central1-a | RUNNING | 51.250.82.0   | 10.128.0.26 |
| fhmrogn76sin3e6lnjg8 | node02 | ru-central1-a | RUNNING | 51.250.10.73  | 10.128.0.18 |
+----------------------+--------+---------------+---------+---------------+-------------+

ssh root@51.250.87.234 - master
ssh root@62.84.125.143 - node01
ssh root@51.250.10.73  - node02
ssh root@51.250.84.235 - node03
ssh root@51.250.82.0   - node04

# change DNS
vim /etc/resolv.conf
add nameserver 8.8.8.8
dig

# edit known_hosts
ssh-keygen -f ~/.ssh/known_hosts -R 51.250.82.0


# install apt
apt-get update
apt install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt-get update -y
apt-get install git pip python3.11 -y

# root 
sudo -i

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.11 get-pip.py

# return to user
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip3.11 install -r requirements.txt

# copy 
cp -rfp inventory/sample inventory/mycluster
declare -a IPS=(10.128.0.34 10.128.0.33 10.128.0.18 10.128.0.17 10.128.0.26)
cd /root/kubespray
CONFIG_FILE=inventory/mycluster/hosts.yaml python3.11 contrib/inventory_builder/inventory.py ${IPS[@]}

# change topology
vim inventory/mycluster/hosts.yaml

# cp private ssh to ansible host
scp ~/.ssh/id_rsa root@62.84.114.215:.ssh/id_rsa

# enter to master
chmod 600 ~/.ssh/id_rsa

# install k8s
cd /root/kubespray
ansible-playbook -i inventory/mycluster/hosts.yaml cluster.yml -b -v &

# config
mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
cp /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

# check k8s
kubectl get nodes
kubectl get po -A
kubectl run nginx --image nginx
kubectl get po -w
kubectl exec -it nginx bash
curl localhost

# check etcd
systemctl status etcd