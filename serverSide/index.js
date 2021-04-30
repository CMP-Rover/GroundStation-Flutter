const express = require('express');
const app = express();
const server = require('http').createServer(app);
const WebSocket = require('ws');
const port = 3000;
const sensorsWss = new WebSocket.Server({server:server, path: "/sensors"});

sensorsWss.on("connection", function connection(ws) {
    console.log('A new client Connected!');
    ws.send('Welcome New Client!');
    
    ws.on("message", function incoming(message){
        console.log("Recived Message %s", message);

        sensorsWss.clients.forEach(function each(client) {
            if (client !== ws && client.readyState == WebSocket.OPEN)
            {
                ws.send(message);
                client.send(message);
            }
        });
    });
} );

app.get('/', (req, res) => res.send('Hello World!'))




server.listen(process.env.PORT, () => console.log(`Lisening on port :3000`))