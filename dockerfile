FROM jupyter/base-notebook

USER root
RUN apt-get update && apt-get install -y \
  make \
  curl \
  file \
  git \
  libmecab-dev \
  mecab \
  mecab-ipadic-utf8


RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
  mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -y && \
  echo dicdir = `mecab-config --dicdir`"/mecab-ipadic-neologd">/etc/mecabrc && \
  sudo cp /etc/mecabrc /usr/local/etc && \
  rm -rf mecab-ipadic-neologd && \
  rm -rf /etc/mecabrc

COPY requirements.txt $PWD

RUN  pip install -r requirements.txt