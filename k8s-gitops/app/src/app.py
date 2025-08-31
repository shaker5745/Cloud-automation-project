from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({
        "service": "sample-app",
        "version": os.environ.get("APP_VERSION", "0.1.0"),
        "message": "Hello from Flask on Kubernetes!"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
