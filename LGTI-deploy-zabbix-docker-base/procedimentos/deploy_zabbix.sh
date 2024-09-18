timedatectl set-timezone America/Sao_Paulo
dnf clean all
dnf check-update
dnf install -y net-tools vim nano epel-release wget curl tcpdump
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf clean all
dnf install -y device-mapper-persistent-data
dnf install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
dnf install -y docker-ce
systemctl enable --now docker
firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --reload
docker swarm init --advertise-addr 10.0.0.8