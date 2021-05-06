const WebSocket = require('ws');
const socket = new WebSocket('wss://gentle-retreat-31408.herokuapp.com/sensors');

// Connection opened
socket.addEventListener('open', function (event) {
    console.log('Connected to WS Server')
});

// Listen for messages
socket.addEventListener('message', function (event) {
    console.log('Message from server ', event.data);
});

const sendMessage = (message) => {
    socket.send(message);
}

const port = 8000;
const express = require('express');
const app = express();

app.listen(port, () => {console.log("Start Listening");})
app.get("/", (req, res) => {
    mess = req.query.message;
    sendMessage(mess);
    res.send("Message is sent");
});