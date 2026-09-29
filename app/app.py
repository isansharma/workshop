from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os


class Handler(BaseHTTPRequestHandler):

    def do_GET(self):
        if self.path == "/health":
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.end_headers()

            response = {
                "status": "healthy",
                "hostname": os.uname().nodename
            }

            self.wfile.write(json.dumps(response).encode())
            return

        self.send_response(404)
        self.end_headers()


server = HTTPServer(("0.0.0.0", 8080), Handler)

print("Application listening on port 8080", flush=True)

server.serve_forever()
