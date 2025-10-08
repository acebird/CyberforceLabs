import re
import fileinput
from pathlib import Path
import socket


# Create Folder
log_dir = Path("/var/logs")
log_dir.mkdir(parents=True, exist_ok=True)

# Create File
log_file = log_dir / "file.log"
log_file.touch(exist_ok=True)


# Edit CSS file
path = Path("/etc/dizquetv/.dizquetv/custom.css")

# Read, replace, and write back
text = path.read_text()
text = re.sub(r"--guide-text\s*:\s*#F0F0f0;", "--guide-text : #b14194:", text, flags=re.IGNORECASE)
path.write_text(text)

HOST = "0.0.0.0"   # listen on all interfaces
PORT = 5000        # choose any test port you like

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen(1)
    
    while True:
        conn, addr = s.accept()
        print(f"Connection from {addr}")
        conn.close()
