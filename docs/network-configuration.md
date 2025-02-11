# 🌐 Network Configuration for VirtualBox VMs

## 📌 Overview
This document explains how to configure networking between `App-VM` and `DB-VM` to enable communication and connectivity.

## 🛠 VirtualBox Network Configuration
Each VM will have **two network adapters**:
1. **NAT (Adapter 1)**
   - Provides internet access for package installations.

2. **Host-Only Adapter (Adapter 2)**
   - Enables internal communication between `App-VM` and `DB-VM`.

### **1️⃣ Configure VirtualBox Network Adapters**
1. Open **VirtualBox**.
2. Select **`App-VM`** → Click **Settings**.
3. Navigate to **Network**:
   - **Adapter 1:** Select **NAT** (for internet access).
   - **Adapter 2:** Select **Host-Only Adapter** (`vboxnet0`).
4. Click **OK**.
5. Repeat the same steps for **`DB-VM`**.

---

## 🔧 **Assigning Static IPs**
Each VM is assigned a static IP for internal communication.

### **App-VM (`192.168.56.101`)**
Edit the network configuration file:
```bash
sudo nano /etc/netplan/50-cloud-init.yaml

Replace the existing content with:

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

Save and apply changes:

```bash
sudo netplan apply

### **DB-VM (`192.168.56.102`)**

Edit the network configuration file:

```bash
sudo nano /etc/netplan/50-cloud-init.yaml

Replace the existing content with:

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

Save and apply changes:

```bash
sudo netplan apply

✅ Testing Network Connectivity
Once both VMs have static IPs assigned, test their connection.

Check IP Address on App-VM
Run:
```bash
ip a

Verify that enp0s8 has the assigned IP (192.168.56.101).

Ping DB-VM from App-VM
```bash
ping 192.168.56.102

Expected output:

```python
64 bytes from 192.168.56.102: icmp_seq=1 ttl=64 time=0.556 ms

Ping App-VM from DB-VM
```bash
ping 192.168.56.10

Expected output:

```python
64 bytes from 192.168.56.101: icmp_seq=1 ttl=64 time=0.556 ms


sudo netplan apply
