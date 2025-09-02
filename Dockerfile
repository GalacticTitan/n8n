# Base n8n image
FROM n8nio/n8n:latest

# Set environment variables
ENV GENERIC_TIMEZONE="IN"
ENV TZ="IN"
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_RUNNERS_ENABLED=true
ENV PYTHONUNBUFFERED=1

# Switch to root to install system packages
USER root

# Install Python, pip, and system tools
RUN apk add --no-cache \
    youtube-dl \
    ffmpeg

# Switch back to node user
USER node

# Expose default n8n port
EXPOSE 5678

# Run n8n
ENTRYPOINT ["n8n"]
CMD []
