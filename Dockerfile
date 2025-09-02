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

# Ensure n8n binds to the correct host/port from Render
ENV N8N_PORT=${PORT}
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://${RENDER_EXTERNAL_HOSTNAME}/

ENTRYPOINT ["n8n"]
CMD []
