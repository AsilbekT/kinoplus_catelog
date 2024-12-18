FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

RUN mkdir -p /app/sockets && chmod -R 777 /app/sockets

VOLUME ["/app/sockets"]

CMD ["gunicorn", "--workers", "3", "--bind", "unix:/app/sockets/gunicorn.sock", "panda_catalog.wsgi:application"]