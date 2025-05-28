# Common base image for both development and production
FROM python:3.13-slim AS base
WORKDIR /usr/local/app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .

# Development-specific image
FROM base AS dev
ENV FLASK_ENV=development
COPY requirements-dev.txt .
RUN pip install --no-cache-dir -r requirements-dev.txt
CMD ["python", "app.py"]

# Production-specific image
FROM base AS prod
ENV FLASK_ENV=production
CMD ["gunicorn", "-b 0.0.0.0:80", "app:server"]