FROM python:3.6-alpine as base

FROM base as builder

RUN mkdir /install
WORKDIR /install

COPY requirements.txt /requirements.txt

RUN pip install --install-option="--prefix=/install" -r /requirements.txt

# MultiStage
FROM base

COPY --from=builder /install /usr/local
COPY . /src
WORKDIR /src

CMD ["gunicorn", "--workers=2", "-b", "0.0.0.0:5000", "--access-logfile=-", "app:app"]