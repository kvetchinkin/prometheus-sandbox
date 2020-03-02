FROM python:3
COPY . /app
WORKDIR /app
ADD requirements.txt .
RUN pip install -r requirements.txt

CMD [ "python", "server.py" ]