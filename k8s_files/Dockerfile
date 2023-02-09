FROM python:3.7

RUN 

WORKDIR /app    

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt



EXPOSE 8000

ENTRYPOINT [ "python3", "hello.py"]
