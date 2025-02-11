const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('Hello from Microservice!');
});

app.post('/data', (req, res) => {
    const receivedData = req.body;
    res.json({ message: 'Data received', data: receivedData });
});

app.listen(port, () => {
    console.log(`Microservice running on port ${port}`);
});
