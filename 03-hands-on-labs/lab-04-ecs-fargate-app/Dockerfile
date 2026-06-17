# -------------------------------------------------------
# Lab 04 — ECS Fargate App Dockerfile
# Minimal Python Flask application
# -------------------------------------------------------

# Stage 1: Build dependencies
FROM python:3.12-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --target=/app/deps -r requirements.txt

# Stage 2: Runtime image
FROM python:3.12-slim

# Non-root user for security
RUN useradd --create-home appuser
USER appuser
WORKDIR /home/appuser/app

# Copy installed deps and app source
COPY --from=builder /app/deps /usr/local/lib/python3.12/site-packages/
COPY app.py .

ENV PORT=8080
EXPOSE 8080

# Healthcheck — ECS uses this if no ALB health check is configured
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/health')"

CMD ["python", "app.py"]
