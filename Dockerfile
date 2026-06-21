FROM python:3.13

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN apt-get update && \
    apt-get install -y libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -r /code/requirements.txt

COPY ./src/api /code
COPY ./best.pt /code/best.pt

EXPOSE 8080

CMD ["python", "/code/live_app.py"] 