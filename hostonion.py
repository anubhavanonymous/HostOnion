#!/usr/bin/env python3

import os
import subprocess
import time
import sys
import socket
import argparse
import shutil

# ---------------- CONFIG ----------------
TOR_DIR = "tor"
HIDDEN_SERVICE_DIR = os.path.join(TOR_DIR, "hidden_service")
TORRC_PATH = os.path.join(TOR_DIR, "torrc")
DEFAULT_PORT = 9000

php_proc = None
tor_proc = None

# -------------------- BANNER --------------------
def banner():
    os.system("clear")
    print("\033[1;92m🧅 HostOnion v2.5 - PHP + CLI + Reset\033[0m\n")

# -------------------- UTIL --------------------
def create_dirs():
    os.makedirs(TOR_DIR, exist_ok=True)

def get_free_port():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('', 0))
    port = s.getsockname()[1]
    s.close()
    return port

# -------------------- PHP SERVER --------------------
def start_php_server(site_folder, port):
    global php_proc
    print(f"[+] Starting PHP server on port {port} (folder: {site_folder})...")
    php_proc = subprocess.Popen(
        ["php", "-S", f"127.0.0.1:{port}", "-t", site_folder],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )

# -------------------- TOR SERVICE --------------------
def start_tor_service(port, reset=False):
    global tor_proc

    # Reset onion if requested
    if reset and os.path.exists(HIDDEN_SERVICE_DIR):
        print("[!] Deleting old onion identity...")
        shutil.rmtree(HIDDEN_SERVICE_DIR)

    os.makedirs(HIDDEN_SERVICE_DIR, exist_ok=True)

    with open(TORRC_PATH, "w") as f:
        f.write(f"""
HiddenServiceDir {HIDDEN_SERVICE_DIR}
HiddenServicePort 80 127.0.0.1:{port}
""")

    print("[+] Starting Tor hidden service...")
    tor_proc = subprocess.Popen(
        ["tor", "-f", TORRC_PATH, "--Log", "notice stdout"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )

    hostname_file = os.path.join(HIDDEN_SERVICE_DIR, "hostname")
    timeout = 60
    start_time = time.time()

    while not os.path.exists(hostname_file):
        if time.time() - start_time > timeout:
            tor_proc.terminate()
            raise Exception("Tor failed to generate onion address.")
        time.sleep(1)

    with open(hostname_file, "r") as f:
        onion = f.read().strip()

    return onion

# -------------------- CLEANUP --------------------
def cleanup():
    global php_proc, tor_proc
    print("\n[!] Stopping services...")
    if php_proc:
        php_proc.terminate()
    if tor_proc:
        tor_proc.terminate()
    sys.exit(0)

# -------------------- MAIN --------------------
def main():
    parser = argparse.ArgumentParser(description="HostOnion - Host PHP sites on Tor")
    parser.add_argument("site_folder", help="Folder containing your site files")
    parser.add_argument("-p", "--port", type=int, help="Specify PHP port")
    parser.add_argument("--new", action="store_true", help="Generate new onion address")
    args = parser.parse_args()

    banner()
    create_dirs()

    if not os.path.exists(args.site_folder):
        print(f"[!] Error: Folder '{args.site_folder}' does not exist.")
        sys.exit(1)

    # Determine port
    port = args.port if args.port else DEFAULT_PORT

    sock = socket.socket()
    try:
        sock.bind(("127.0.0.1", port))
        sock.close()
    except:
        port = get_free_port()
        print(f"[!] Port busy, using free port {port}")

    # Start services
    start_php_server(args.site_folder, port)
    onion = start_tor_service(port, reset=args.new)

    print(f"\n[+] Onion URL: \033[1;92mhttp://{onion}\033[0m")
    print(f"[+] PHP running on port {port}")
    print("[+] Press CTRL+C to stop.")

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        cleanup()

if __name__ == "__main__":
    main()
