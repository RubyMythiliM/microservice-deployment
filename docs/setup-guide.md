# 🛠 VirtualBox Setup Guide

## 📌 Prerequisites
- Install **VirtualBox** from [VirtualBox Official Site](https://www.virtualbox.org/).
- Download **Ubuntu 22.04 ISO** from [Ubuntu Download Page](https://ubuntu.com/download/server).

## 📂 Virtual Machine Setup
### **1️⃣ Create Virtual Machines**
1. Open **VirtualBox** → Click **New**.
2. Set the following:
   - **VM Name:** `App-VM`
   - **Type:** `Linux`
   - **Version:** `Ubuntu (64-bit)`
   - **Memory (RAM):** 2GB
   - **Disk Size:** 20GB
3. Click **Create**.
4. **Repeat for `DB-VM`.**

### **2️⃣ Attach Ubuntu ISO & Install**
1. Select **App-VM** → **Settings** → **Storage**.
2. Click **Empty** under **Controller: IDE**.
3. Choose the **Ubuntu ISO file** and click **OK**.
4. Start the VM and follow the Ubuntu installation steps.

## 📸 Screenshots to Capture
- **VirtualBox New VM Settings**
- **Ubuntu ISO Attached**
- **Installation Screen**
