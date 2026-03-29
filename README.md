<h1 align="center">
<img src="logo.jpg"><br>
</h1>

# 🧅 HostOnion v2.5

* `HostOnion Enables users to Host A Hidden Service on TOR with an Onion Address !`
* `This tool uses your device as a server and hosts your PHP webpage on the Deepweb temporarily with a unique onion URL`

---

## 🚀 About HostOnion

HostOnion allows you to instantly host your website as a **Tor Hidden Service** directly from your device.

It automatically:
- Starts a local PHP server
- Configures Tor hidden service
- Generates a unique `.onion` address
- Routes traffic securely through Tor network

Your device becomes a temporary Deep Web server while the script is running.

---

## 🔄 What Changed

### 🐍 Current Version (v2.5)
- Fully rewritten in **Python 3**
- Cleaner process handling
- Custom site folder support
- Full PHP support (not just static sites)
- Optional custom port selection (`--port`)
- Auto free-port detection
- Easy onion reset (`--new`)
- More stable and lightweight
- Works on Termux + Linux

---

## 📦 Requirements

- Python 3
- PHP
- Tor

### Install on Termux
```bash
pkg install python php tor
```
## ⚙️ Installation
```bash
git clone https://github.com/anubhavanonymous/HostOnion
```
```bash
cd HostOnion
```
## 🖥 Usage

### Basic Usage
```bash
python3 hostonion.py your_site_folder
```
#### I've added an example template 
```bash
python3 hostonion.py examplesite
```
### Custom Port
```bash
python3 hostonion.py your_site_folder --port 8080
```
### Generate New Onion Address
```bash
python3 hostonion.py your_site_folder --new
```
Press CTRL+C to stop the service

## 🔹 Example Output
```bash
🧅 HostOnion v2.5 - PHP + CLI + Reset

Author: Anubhav Kashyap                                                                 GitHub: github.com/anubhavanonymous | Telegram: @anubhavanonymous

[+] Starting PHP server on port 9000 (folder: example_site)...
[+] Starting Tor hidden service...

[+] Onion URL: http://xxxxxxxxxxxxxxxx.onion
[+] PHP running on port 9000
[+] Press CTRL+C to stop.
```

## 🖼️ UI Dashboard 
<p align="center">
  <img src="screenshot.png" alt="Tele-Trace Intelligence Banner" width="100%">
</p>

## 🧠 How It Works
1. Starts PHP built-in server on localhost

2. Creates Tor configuration (torrc)

3. Generates hidden service directory

4. Launches Tor

5. Waits for onion address

6. Displays your unique . onion URL

Once stopped, the hidden service becomes unavailable.

## ⚠️ Disclaimer
This tool is for educational purposes only ! I will not be responsible for any misuse

## 📌 Note
• Originally made for Termux users.

• Now works on Termux, Linux, and other POSIX systems.

• Designed to run even on low-end Android devices.

• Service runs temporarily while script is active

## 👨‍💻 Author
### Anubhav Kashyap
• Github : https://github.com/anubhavanonymous

• Telegram : https://t.me/anubhavanonymous



