# 🌍 Load Balancer Configuration (NGINX)

## 📌 Overview
To manage traffic distribution, we configure **NGINX as a Load Balancer** on `App-VM`.

## 🛠 Installing NGINX
```bash
sudo apt install nginx -y
```

## ⚙️ Configure Load Balancer
```bash
sudo nano /etc/nginx/sites-available/default
```
Modify the file to include the following:
```nginx
upstream backend {
    server 192.168.56.101:3000;
    server 192.168.56.102:3000;
}

server {
    listen 80;
    location / {
        proxy_pass http://backend;
    }
}
```

## ✅ Restart NGINX
```bash
sudo systemctl restart nginx
```

## 🔎 Testing the Load Balancer
```bash
curl http://localhost
```
Expected output should route the request to one of the microservices running on `App-VM` or `DB-VM`.

## 📸 Screenshots to Capture
- **Editing `nginx/sites-available/default`**
- **Successful response from Load Balancer (`curl http://localhost`)**

---

## 🎯 **Conclusion**
This guide ensures that NGINX is properly configured as a Load Balancer for the microservice architecture.
