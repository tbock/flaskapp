import flask

app = flask.Flask(__name__)

def test_name():
    with app.test_request_context('/anybody?name=Peter'):
        assert flask.request.path == '/anybody'
        assert flask.request.args['name'] == 'Peter'