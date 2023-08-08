const express = require('express')
const app = express()
const os = require('os');
const port = 3000

app.get('/', (req, res) => {
    res.send(`Hello Frontend from  container: ${os.hostname()}`);
})
app.listen(port, () => {
    console.log(`Server Started on Port  ${port}`)
})
