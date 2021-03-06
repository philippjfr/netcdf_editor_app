FROM python:3.8

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /usr/src/app
COPY app.ipynb .

EXPOSE 8080
ENTRYPOINT panel serve --num-procs=1 --port=8080 --address=0.0.0.0 --allow-websocket-origin=* --websocket-max-message-size=100000000 app.ipynb