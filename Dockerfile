FROM python:3.12-slim

RUN mkdir /app 

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=main:app
ENV GUNICORN_BIND_ADDRESS=0.0.0.0:5000

CMD ["python", "-m", "gunicorn", "-b", "$GUNICORN_BIND_ADDRESS", "$FLASK_APP"]