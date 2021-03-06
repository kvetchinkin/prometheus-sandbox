import http.server
import time
import random
from prometheus_client import start_http_server, Counter, Gauge, Histogram

REQUESTS = Counter('hello_worlds_total', 'Hello Worlds requested')

INPROGRESS = Gauge('hello_worlds_inprogress',
                   'Number of Hello Worlds in progress.')

LAST = Gauge('hello_world_last_time_seconds',
             'The last time a Hello World was served.')

LATENCY = Histogram('hello_world_latency_seconds',
                    'Time for a request Hello World.')


class MyHandler(http.server.BaseHTTPRequestHandler):
    @INPROGRESS.track_inprogress()
    @LATENCY.time()
    def do_GET(self):
        REQUESTS.inc()

        time.sleep(random.uniform(0.5, 2))
        self.send_response(200)
        self.end_headers()

        self.wfile.write(b"Hello World")
        LAST.set(time.time())


if __name__ == "__main__":
    start_http_server(8000)
    server = http.server.HTTPServer(('0.0.0.0', 8001), MyHandler)
    server.serve_forever()
