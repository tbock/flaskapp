FROM python:alpine

RUN mkdir app
WORKDIR /app

COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY . /app
# $PORT provided by heroku or by setting -e PORT=8080 in docker run
# docker build . -t myflaskapp
# eg. docker run -e PORT=8080 -p 8080:8080 myflaskapp
CMD ["sh", "-c", "gunicorn app:app -b 0.0.0.0:$PORT"]