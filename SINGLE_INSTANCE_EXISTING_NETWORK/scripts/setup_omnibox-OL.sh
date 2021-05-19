install_gitlab() {

    firewall-offline-cmd --add-service=http
    firewall-offline-cmd --add-service=https
    systemctl reload firewalld

    firewall-cmd --zone=public --permanent --add-port=80/tcp
    firewall-cmd --zone=public --permanent --add-port=443/tcp
    firewall-cmd --zone=public --permanent --add-port=5432/tcp
    firewall-cmd --zone=public --permanent --add-port=9100/tcp
    firewall-cmd --zone=public --permanent --add-port=9187/tcp
    firewall-cmd --reload
}

install_gitlab
