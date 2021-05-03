# image 
FROM python:3.8
# working directory
WORKDIR /Flask_Blog

#requirements
RUN pip install pipenv
RUN pip install flask
RUN pip install psutil
RUN pipenv install flask
RUN pipenv install psutil

# build by piplock
ONBUILD ADD ./Pipfile /Pipfile
ONBUILD ADD ./Pipfile.lock /Pipfile.lock
RUN pipenv install --dev --deploy --system

# copy the app
COPY app.py .
#create environment variables 
ENV MYVAR ENV-HELLO
ENV FLASK_APP app.py

EXPOSE 5000
#running the app
CMD [ "python3", "/Flask_Blog/app.py"]