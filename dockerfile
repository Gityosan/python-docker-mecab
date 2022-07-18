FROM python:3.8

WORKDIR /opt/app

RUN apt update \
  && apt upgrade -y \
  && apt install -y mecab libmecab-dev mecab-ipadic-utf8 git make curl xz-utils file sudo gcc g++

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
  && mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y \
  && rm -rf mecab-ipadic-neologd

COPY src/requirements.txt .
RUN pip install -r requirements.txt