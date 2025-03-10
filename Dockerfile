FROM nangohq/nango-server:hosted@sha256:2ed38f8a320b71b8ab087397d446355eca5d37f7a3ae65ff0f7c7d92f17edea6

ARG NANGO_ENCRYPTION_KEY
ARG NANGO_DB_USER
ARG NANGO_DB_PASSWORD
ARG NANGO_DB_HOST
ARG NANGO_DB_PORT
ARG NANGO_DB_NAME
ARG NANGO_DB_SSL
ARG RECORDS_DATABASE_URL

ARG PORT
ARG NANGO_SERVER_URL
ARG NANGO_DASHBOARD_USERNAME
ARG NANGO_DASHBOARD_PASSWORD
ARG LOG_LEVEL
ARG TELEMETRY
ARG NANGO_SERVER_WEBSOCKETS_PATH
ARG NANGO_LOGS_ENABLED
ARG NANGO_LOGS_ES_URL
ARG NANGO_LOGS_ES_USER
ARG NANGO_LOGS_ES_PWD

ENV NANGO_DB_MIGRATION_FOLDER=/usr/nango-server/src/packages/database/lib/migrations
ENV NANGO_ENCRYPTION_KEY=${NANGO_ENCRYPTION_KEY}
ENV NANGO_DB_USER=${NANGO_DB_USER}
ENV NANGO_DB_PASSWORD=${NANGO_DB_PASSWORD}
ENV NANGO_DB_HOST=${NANGO_DB_HOST}
ENV NANGO_DB_PORT=${NANGO_DB_PORT}
ENV NANGO_DB_NAME=${NANGO_DB_NAME}
ENV NANGO_DB_SSL=${NANGO_DB_SSL}
ENV RECORDS_DATABASE_URL=${RECORDS_DATABASE_URL:-postgresql://nango:nango@nango-db:5432/nango}
ENV SERVER_PORT=${PORT}
ENV NANGO_SERVER_URL=${NANGO_SERVER_URL:-http://localhost:3003}
ENV NANGO_DASHBOARD_USERNAME=${NANGO_DASHBOARD_USERNAME}
ENV NANGO_DASHBOARD_PASSWORD=${NANGO_DASHBOARD_PASSWORD}
ENV LOG_LEVEL=${LOG_LEVEL:-info}
ENV TELEMETRY=${TELEMETRY}
ENV NANGO_SERVER_WEBSOCKETS_PATH=${NANGO_SERVER_WEBSOCKETS_PATH}
ENV NANGO_LOGS_ENABLED=${NANGO_LOGS_ENABLED:-false}
ENV NANGO_LOGS_ES_URL=${NANGO_LOGS_ES_URL:-http://nango-elasticsearch:9200}
ENV NANGO_LOGS_ES_USER=${NANGO_LOGS_ES_USER}
ENV NANGO_LOGS_ES_PWD=${NANGO_LOGS_ES_PWD}

COPY extra_providers.yaml /usr/nango-server/src/extra_providers.yaml
RUN cat /usr/nango-server/src/extra_providers.yaml >> /usr/nango-server/src/packages/shared/providers.yaml

COPY logos/* /usr/nango-server/src/packages/webapp/build/images/template-logos/
RUN ls -la /usr/nango-server/src/packages/webapp/build/images/template-logos/
COPY run.sh /usr/bin/run.sh

EXPOSE ${PORT:-3003}
WORKDIR /usr/nango-server/src

ENTRYPOINT [ "bash", "/usr/bin/run.sh" ]
