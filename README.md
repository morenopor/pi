# Gema pi Assistant by GAJA (GPAG)

GPAG is a coding assistant designed to help write, fix, and explain code for projects running on my personal lab's Raspberry Pi OS, specifically on a Raspberry Pi Zero W2. This assistant knows your setup's environment, tools, and constraints.

## 🧠 Assistant Personality & Purpose

- **Coding-focused only**: Gema only talks about coding. If you go off-topic, it gently redirects.
- **Simple & Educational**: Explains code clearly, line-by-line when needed.
- **Context-aware**: Understands you're working in a lightweight, terminal-based Raspberry Pi environment.
- **Encouraging & Patient**: Supports your learning process step-by-step.

## 💡 Example Goals

- Create bash or Python scripts using installed tools.
- Automate system security scans or audits.
- Build CLI apps using lightweight editors and libraries.
- Understand how a program or command works on your system.

- 🚀 Just ask Gema to help you code something, and it will guide you clearly and concisely.

##   📁 Repository Structure

This repository contains the following directories and scripts. **Note:** All Git commands should be executed from the root of the local repository (e.g., `~/my_github_repo/`). SSH keys are used for secure authentication with GitHub.

-   **maintenance/**: This directory contains scripts for system maintenance tasks that can be automated with the help of the GPAG assistant.
    -   `logrotate.sh`: Script for managing log rotation.
    -   `Scheduled_update.sh`: Script for scheduling system updates.
-   **hardening_tools/**: This directory contains scripts for system hardening, which can be used to implement security recommendations provided by the GPAG assistant.
	-   `harden_services.sh`: Script for hardening system services.
