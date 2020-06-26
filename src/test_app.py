from app import app
import json
import socket
import os.path


# The first and the second test validate json structure
def test_get_status_code():
    app.config["TESTING"] = True
    with app.test_client() as client:
        response = client.get("/request")
        assert response.status_code == 200

def test_get_status_msg():
    app.config["TESTING"] = True
    host = socket.gethostname()
    with app.test_client() as client:
        response = client.get("/request")
        assert response.json == {
            'response': "Olá " + host + "! " + "A resposta é ficar em casa!"
        }