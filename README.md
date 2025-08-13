# 🚀 Docker + vLLM Setup Script for Ubuntu (ROCm AMD GPUs)

This repository contains a **bash script** that automates the installation and configuration of **Docker** and **vLLM** for **AMD ROCm-enabled GPUs** on **Ubuntu**.  
It sets up all required dependencies, installs the official Docker packages, configures permissions for non-root Docker usage, and provides instructions to run the **ROCm vLLM** container.

---

## 📋 Requirements

### **Operating System**
- Ubuntu **24.04.2 LTS** (Noble Numbat)

### **GPU & Driver**
- AMD GPU with **ROCm 6.4.1** or newer

### **Installed Software Versions**
- **Docker Engine:** 28.2.2 ([release notes](https://docs.docker.com/engine/release-notes/))
- **Docker Compose:** Included with Docker Engine
- **vLLM Docker image:** [`rocm/vllm`](https://hub.docker.com/r/rocm/vllm)
- **vLLM Version:** `0.9.0.2.dev108+g71faa1880.rocm641`

---

## ⚡ Features

- Installs Docker Engine & Docker Compose from the **official Docker repository**.
- Configures the system to run Docker **without `sudo`**.
- Ensures **Docker starts on boot**.
- Prepares your system for running **vLLM** with ROCm GPU support.
- Provides tested run command for AMD GPU hardware passthrough.

---

## 🛠 Installation

1. **Clone this repository**
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git
   cd <your-repo>
Make the script executable

bash
Copy
Edit
chmod +x setup_docker_vllm.sh
Run the script

bash
Copy
Edit
./setup_docker_vllm.sh
