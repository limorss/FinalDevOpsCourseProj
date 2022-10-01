FROM python:latest

# Prerequisites
RUN apt-get -y update
RUN apt-get install -y libnss3

# From https://www.2daygeek.com/install-google-chrome-browser-on-linux/
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

# Passing arguments 
ARG PROJ_NAME
ARG PORT
ENV PROJ_NAME $PROJ_NAME
ENV PORT $PORT

# Preparing environment for project
WORKDIR /$PROJ_NAME
COPY *.py /$PROJ_NAME/
COPY requirements.txt /$PROJ_NAME/requirements.txt
COPY Scores.txt /$PROJ_NAME/Scores.txt
RUN pip3 install -r /$PROJ_NAME/requirements.txt
EXPOSE $PORT
CMD ["python", "MainScores.py"]
