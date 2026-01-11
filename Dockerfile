FROM python:3.8-slim
WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/
COPY model/ ./model/


RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

EXPOSE 8080

CMD [ "uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8080" ]