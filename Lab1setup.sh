#Create Users
sudo useradd -m -p $(openssl passwd -1 'password1') user1
sudo useradd -m -p $(openssl passwd -1 'password2') user2
sudo useradd -m -G sudo -p $(openssl passwd -1 'Sup3rS3cureP@22w0rd') admin1

#Add files to user1's home directory
sudo touch /home/user1/file1.txt
sudo touch /home/user1/file2.txt
sudo touch /home/user1/file3.txt
sudo touch /home/admin1/donttouch.txt

#Give file2.txt bad permissions
sudo chmod 777 /home/user1/file2.txt
sudo chmod +x /home/user1/file2.txt


#Add script to binary path
sudo touch /usr/local/bin/Hello.sh
sudo bash -c 'printf "%s\n" "#!/bin/bash" "echo \"Hello There\"" > /usr/local/bin/Hello.sh'
sudo chmod +x /usr/local/bin/Hello.sh
sudo chmod 777 /usr/local/bin/Hello.sh

#Add service that runs Hello.sh
sudo bash -c 'printf "%s\n" "[Unit]" "Description=Run Hello.sh script" "" "[Service]" "Type=oneshot" "ExecStart=/usr/local/bin/Hello.sh" "" "[Install]" "WantedBy=multi-user.target" > /etc/systemd/system/Hello.service'

#Add timer to run the service
sudo bash -c 'printf "%s\n" "[Unit]" "Description=Run Hello.service every 5 seconds" "" "[Timer]" "OnUnitActiveSec=5s" "AccuracySec=1s" "" "[Install]" "WantedBy=timers.target" > /etc/systemd/system/Hello.timer'

#Enable and Start Hello.service
sudo systemctl enable Hello.service
sudo systemctl start Hello.service

#Enable and Start the Timer
sudo systemctl daemon-reload
sudo systemctl enable --now Hello.timer