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
# Copy cookie.txt into the container (into /home/node)
COPY cookies.txt /home/node/cookies.txt
# Give permissions so node user can access it
RUN chown node:node /home/node/cookies.txt

USER node

ENTRYPOINT ["n8n"]
CMD []
