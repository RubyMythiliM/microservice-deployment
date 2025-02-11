# 🚀 Microservice Deployment Guide

## 📌 Installing Required Packages
Run the following commands on `App-VM` to install required dependencies:
```bash
sudo apt update && sudo apt install -y nodejs npm git docker.io
```

## 📂 Cloning the Repository
```bash
git clone https://github.com/RubyMythiliM/microservice-deployment.git
cd microservice-deployment/microservice-app
```

## ✨ Running the Microservice
### **1️⃣ Create API File (`server.js`)**
```javascript
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
    res.send('Hello from App-VM Microservice!');
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
```

### **2️⃣ Start the API**
```bash
node server.js
```

### **3️⃣ Test the API**
```bash
curl http://localhost:3000
```
Expected output:
```
Hello from App-VM Microservice!
```

## 📸 Screenshots Captured
- **Running `git clone` inside `App-VM`.**
- **Microservice running (`node server.js`).**
- **Testing `curl http://localhost:3000`**

---

## 🎯 **Conclusion**
This guide ensures that a microservice is deployed and running on `App-VM`. The next step is to configure a load balancer to manage requests across multiple instances.
