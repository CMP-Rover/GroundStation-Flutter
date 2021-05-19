const url = require('url');
const express = require('express');
const app = express();
const server = require('http').createServer(app);
const WebSocket = require('ws');
const port = 3000 | process.env.PORT;

function getSockets(sensors)
{
    let sockets = new Map();
    for (const [key, value] of sensors.entries()){
        sockets.set(key, new WebSocket.Server({noServer:true , path: value}));
    }
    return sockets;
}

function createWebSocketConnection(sockets)
{
    sockets.forEach((socket, key) => {
        socket.on("connection", function connection(ws) {
            console.log('A new client Connected!');
            ws.send('Connected Successfully');

            ws.on("message", function incoming(message){
                console.log("Recived Message from %s :  %s",key,  message);

                socket.clients.forEach(function each(client) {
                    if (client !== ws && client.readyState == WebSocket.OPEN)
                    {
                        ws.send(message);
                        client.send(message);
                    }
                });
            });
        } );
    })
}

function serverSockets(sockets)
{
    server.on('upgrade', (request, socket, head) => {
        const pathname = url.parse(request.url).pathname;
        console.log(pathname);
        sockets.forEach((Socket, route) => {
            let path = "/" + route;
            if (path === pathname)
            {
                Socket.handleUpgrade(request, socket, head, socket => {
                    Socket.emit('connection', socket, request);
                })
            }
        });


    });
}


let sensors = new Map();
sensors.set("tempreture", "/tempreture");
sensors.set("pressure", "/pressure");
sensors.set("relative_humidity", "/relative_humidity");
sensors.set("gas_emission", "/gas_emission");
sensors.set("movement", "/movement");

sockets = getSockets(sensors);
createWebSocketConnection(sockets);
app.get('/', (req, res) => res.send('Hello World!'))
server.listen(3000, () => console.log(`Lisening on port : ` + port));
serverSockets(sockets);