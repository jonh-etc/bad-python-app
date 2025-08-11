import os
import flask
import subprocess

app = flask.Flask(__name__)


@app.route("/route_param/<route_param>")
def route_param(route_param):
    allowed_commands = {
        "uptime": ["uptime"],
        "ls": ["ls", "-l"],
    }

    if route_param not in allowed_commands:
        return "nice try!"

    subprocess.call(allowed_commands.get(route_param))

    return "slightly better"


# Flask true negatives
@app.route("/route_param/<route_param>")
def route_param2(route_param):

    # ok:dangerous-os-exec
    os.execl("static")

    return "ok!"
