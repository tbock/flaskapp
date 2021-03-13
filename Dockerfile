#use minimal python image as a base
FROM python:alpine

# make a directory to use and make that the working directory
RUN mkdir app
WORKDIR /app

# copy our same requirements file and install them along with gunicorn thats only used here
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install gunicorn

# copy our app into the current working directory
COPY . ./

# $PORT provided by heroku or by setting -e PORT=8080 in docker 
# to build and run...
# docker build . -t myflaskapp
# docker run -e PORT=8080 -p 8080:8080 myflaskapp
CMD ["sh", "-c", "gunicorn app:app -b 0.0.0.0:$PORT"]