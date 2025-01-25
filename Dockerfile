FROM python:3.12-slim

RUN mkdir /app 

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD ["python", "-m", "gunicorn", "-b", "0.0.0.0:5000S", "main:app"]