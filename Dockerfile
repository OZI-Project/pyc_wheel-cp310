
FROM oziproject/supported-python:2023
COPY . .
COPY action.sh .
RUN chmod +x action.sh
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends git \
  && rm -rf /var/lib/apt/lists/* \
  && rm -f /var/cache/apt/archives/*.deb
WORKDIR /pyc_wheel
RUN /root/.pyenv/versions/$(/root/.pyenv/bin/pyenv latest 3.10)/bin/python -m pip install .
ENTRYPOINT ["bash", "action.sh"]

