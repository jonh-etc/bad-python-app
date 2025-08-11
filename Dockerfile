FROM python:3.7

RUN apt-get update && apt-get install -y imagemagick

# create a new user called "flask", 
# give it a home directory and the default bash shell
RUN useradd -m -s /bin/bash flask

WORKDIR /usr/src/app

COPY . .

RUN sh setup.sh

# change user + group over working directory to flask
RUN chown -R flask:flask /usr/src/app

# switch to flask user
USER flask

ENV FLASK_APP app
ENV FLASK_ENV development

EXPOSE 5000

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
CMD [ "sh", "run.prod.sh"]
