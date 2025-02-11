# 🌐 Network Configuration for VirtualBox VMs

## 📌 Overview
This document provides a step-by-step guide to configuring networking for VirtualBox virtual machines (`App-VM` and `DB-VM`). The objective is to ensure that:
- Each VM has internet access.
- `App-VM` and `DB-VM` can communicate with each other via a private network.

## 🛠 VirtualBox Network Configuration
Each VM will have **two network adapters**:
1. **NAT (Adapter 1):** Provides internet access for downloading packages.
2. **Host-Only Adapter (Adapter 2):** Enables internal communication between `App-VM` and `DB-VM`.

### **1️⃣ Configure VirtualBox Network Adapters**
#### **For `App-VM`**
1. Open **VirtualBox**.
2. Select **`App-VM`** → Click **Settings**.
3. Navigate to **Network**:
   - **Adapter 1:** Select **NAT**.
   - **Adapter 2:** Select **Host-Only Adapter** (`vboxnet0`).
4. Click **OK**.

#### **For `DB-VM`**
1. Open **VirtualBox**.
2. Select **`DB-VM`** → Click **Settings**.
3. Navigate to **Network**:
   - **Adapter 1:** Select **NAT**.
   - **Adapter 2:** Select **Host-Only Adapter** (`vboxnet0`).
4. Click **OK**.

---

## 🔧 **Assigning Static IPs**
Each VM is assigned a static IP for internal communication.

### **2️⃣ Configure Static IPs**
#### **On `App-VM`** (`192.168.56.101`)
1. Open a terminal and edit the network configuration file:
   ```bash
   sudo nano /etc/netplan/50-cloud-init.yaml
   ```
2. Replace the content with:
   ```yaml
   network:
     ethernets:
       enp0s8:
         dhcp4: no
         addresses: [192.168.56.101/24]
         gateway4: 192.168.56.1
         nameservers:
           addresses: [8.8.8.8, 8.8.4.4]
     version: 2
   ```
3. Save the file (`CTRL+X`, then `Y`, then `Enter`).
4. Apply the configuration:
   ```bash
   sudo netplan apply
   ```

#### **On `DB-VM`** (`192.168.56.102`)
1. Open a terminal and edit the network configuration file:
   ```bash
   sudo nano /etc/netplan/50-cloud-init.yaml
   ```
2. Replace the content with:
   ```yaml
   network:
     ethernets:
       enp0s8:
         dhcp4: no
         addresses: [192.168.56.102/24]
         gateway4: 192.168.56.1
         nameservers:
           addresses: [8.8.8.8, 8.8.4.4]
     version: 2
   ```
3. Save the file (`CTRL+X`, then `Y`, then `Enter`).
4. Apply the configuration:
   ```bash
   sudo netplan apply
   ```

---

## ✅ **Testing Network Connectivity**
Once both VMs have static IPs assigned, test their connection.

### **1️⃣ Check IP Address on `App-VM`**
Run:
```bash
ip a
```
Verify that `enp0s8` has the assigned IP (`192.168.56.101`).

### **2️⃣ Ping `DB-VM` from `App-VM`**
```bash
ping 192.168.56.102
```
Expected output:
```
64 bytes from 192.168.56.102: icmp_seq=1 ttl=64 time=0.556 ms
```

### **3️⃣ Ping `App-VM` from `DB-VM`**
```bash
ping 192.168.56.101
```
Expected output:
```
64 bytes from 192.168.56.101: icmp_seq=1 ttl=64 time=0.556 ms
```

---

## 📸 **Screenshots to Capture**
To include proof in the documentation, capture the following screenshots:
1. **VirtualBox Network Adapter Settings** (showing NAT and Host-Only Adapter).
2. **Editing `/etc/netplan/50-cloud-init.yaml`** inside `App-VM` and `DB-VM`.
3. **Successful `ping` test between the VMs**.

---

## 🎯 **Conclusion**
By following this guide, `App-VM` and `DB-VM` can communicate internally while retaining internet access. This setup is essential for deploying the microservice on `App-VM` while connecting to a database on `DB-VM`.
