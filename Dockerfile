FROM python:3.11.3-slim-buster


WORKDIR /usr/build

COPY requirements.txt .

RUN pip install -r requirements.txt --use-pep517 --user

WORKDIR /usr/app

COPY static static
COPY templates templates
COPY main.py .
COPY instance instance
COPY uploads uploads


EXPOSE 5000

ENV FLASK_APP=main.py


CMD [ "python3", "-m" , "flask", "run"]
