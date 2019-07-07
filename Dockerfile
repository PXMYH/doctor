FROM python:3.7.2-alpine3.9
LABEL maintainer <Michael Hu>

COPY requirements.txt .

RUN apk add --no-cache --update \
  # install flask
  && pip install -U pip && pip install -r requirements.txt \
  # remove cache
  && rm -rf /var/cache/apk/*

EXPOSE 80 443
EXPOSE 5000

ENV APP_DIR /knative/app
ENV FLASK_APP echo.py

RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}
COPY ${FLASK_APP} ${APP_DIR}

ENTRYPOINT ["python3"]
CMD ["echo.py"]