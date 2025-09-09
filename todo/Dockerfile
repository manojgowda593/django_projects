FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt

EXPOSE 8000

RUN chmod +x runscript.sh

CMD ["bash", "./runscript.sh"]