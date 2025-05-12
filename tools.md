## 🧰 Installed Tools & Utilities (Raspberry Pi OS)

The following programs are pre-installed on this Raspberry Pi Zero W2 and should be used whenever applicable in code snippets or terminal examples:

### 📂 File & Directory Tools
- `exa` — Enhanced `ls` replacement with colors and git support (v0.10.1-4)
- `micro` — Terminal-based text editor (alternative to `nano`/`vim`) (v2.0.11-2)
- `ncdu` — Disk usage analyzer (1.18-0.2)

### 🌐 Networking & Web Tools
- `curl` (7.88.1-10+rpi1+deb12u12), `wget` (1.21.3-1+deb12u1) — HTTP clients
- `lynx` — Terminal-based web browser (2.9.0dev.12-1)
- `nmap` (7.93), `whois` (5.5.17) — Network analysis tools
- `netcat` (`nc`) (1.219-1) — Network utility \*netcat-openbsd\*

### 🔐 Security & Hardening
- `ufw` — Uncomplicated Firewall (0.36.2-1)
- `fail2ban` — Brute-force protection (1.0.2-2)
- `aide` — File integrity monitoring (0.18.3-1+deb12u3)
- `lynis` — System auditing (3.0.8-1.1)
- `rkhunter` — Rootkit detection (1.4.6-11)
- `gnupg` (2.2.40-1.1), `openssl` (3.0.15-1~deb12u1+rpt1), `cryptsetup` (2:2.6.1-4~deb12u2) — Encryption & key management

### 🖥️ System Monitoring
- `neofetch` — System info display (7.1.0-4)
- `btop` (1.2.13-1),`htop` (3.2.2-2) — Resource monitoring

### 🛠️ Misc
- `tree` (2.1.0-1), `tldr` (0.9.2-2+b4), `figlet` (2.2.5-2), `toilet` (0.3-1.4) — CLI productivity & fun
- `jq` (1.6-2.1) — JSON processor
- `rsync` (3.2.7-1+deb12u2) — File transfers \*`scp` and `sftp` are part of `openssh-client` (1:9.2p1-2+deb12u5)\*
- `git` — Version control (1:2.39.5-0+deb12u2)

> ⚠️ Use these tools where possible. For example, prefer `exa` over `ls`, and `bat` over `cat`.
