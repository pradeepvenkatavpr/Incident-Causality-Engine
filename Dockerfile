FROM python:3.12-slim-bookworm

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_ROOT_USER_ACTION=ignore \
    PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PORT=8000 \
    HOST=0.0.0.0 \
    APP_HOME=/app \
    APP_ENV=production

WORKDIR ${APP_HOME}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        tini \
        gcc \
        libc6-dev \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd --system appgroup \
    && useradd --system --gid appgroup --home-dir ${APP_HOME} --shell /usr/sbin/nologin appuser \
    && mkdir -p ${APP_HOME}/data ${APP_HOME}/logs ${APP_HOME}/artifacts \
    && chown -R appuser:appgroup ${APP_HOME}

COPY requirements.txt ${APP_HOME}/requirements.txt

RUN python -m pip install --upgrade pip setuptools wheel \
    && python -m pip install --requirement ${APP_HOME}/requirements.txt \
    && python -m pip check \
    && python -m pip cache purge

COPY --chown=appuser:appgroup . ${APP_HOME}/

RUN chmod -R u=rwX,g=rX,o= ${APP_HOME} \
    && chown -R appuser:appgroup ${APP_HOME}

USER appuser

EXPOSE 8000

STOPSIGNAL SIGTERM

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
    CMD python -c "import os,urllib.request; u='http://127.0.0.1:'+os.getenv('PORT','8000')+'/health'; r=urllib.request.urlopen(u,timeout=4); exit(0 if r.status == 200 else 1)" || exit 1

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["sh", "-c", "exec uvicorn main:app --host ${HOST:-0.0.0.0} --port ${PORT:-8000} --workers ${WEB_CONCURRENCY:-1} --proxy-headers"]
