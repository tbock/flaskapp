FROM python:alpine

RUN mkdir app
WORKDIR /app

COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY . /app

CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]