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
ONBUILD ADD ./Pipfile /Pipfile
ONBUILD ADD ./Pipfile.lock /Pipfile.lock
RUN pipenv install --dev --deploy --system
COPY secret.txt .
COPY app.py .
ENV MYVAR ENV-HELLO
ENV FLASK_APP app.py
#running the app
CMD [ "python3", "./app.py"]