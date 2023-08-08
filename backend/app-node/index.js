const express = require('express')
const app = express()
const os = require('os');
const port = 5000

app.get('/', (req, res) => {
    res.send(`Hello Backend from container: ${os.hostname()}`);
})
app.listen(port, () => {
    console.log(`Server Started on Port  ${port}`)
})
