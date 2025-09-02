# Base n8n image
FROM n8nio/n8n:latest

ENV GENERIC_TIMEZONE="IN"
ENV TZ="IN"
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_RUNNERS_ENABLED=true
ENV PYTHONUNBUFFERED=1

USER root
RUN apk add --no-cache \
    youtube-dl \
    ffmpeg
USER node

# Render sets $PORT dynamically, no need for EXPOSE
# Ensure n8n binds to it
ENV N8N_PORT=$PORT
ENV N8N_HOST=0.0.0.0

ENTRYPOINT ["n8n"]
CMD []
