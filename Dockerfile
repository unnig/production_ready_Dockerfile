# syntax=docker/dockerfile:1

FROM python:3.13-alpine AS builder

ENV PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

RUN python -m venv /opt/venv

COPY requirements.txt .
RUN /opt/venv/bin/python -m pip install --only-binary=:all: --no-cache-dir -r requirements.txt \
    && /opt/venv/bin/python -m pip uninstall -y pip setuptools wheel >/dev/null 2>&1 || true \
    && find /opt/venv -type f -name '*.pyc' -delete \
    && find /opt/venv -type d -name '__pycache__' -prune -exec rm -rf {} +

FROM python:3.13-alpine AS runtime

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PATH="/opt/venv/bin:$PATH"

WORKDIR /app

RUN addgroup -S app && adduser -S -G app app

COPY --from=builder --chown=app:app /opt/venv /opt/venv
COPY --chown=app:app app.py ./app.py

USER app

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "--access-logfile", "-", "--error-logfile", "-", "app:app"]
