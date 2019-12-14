FROM keimlink/sphinx-doc:1.7.1

# Install python dependencies
COPY --chown=1000:1000 requirements.txt ./
RUN . .venv/bin/activate \
    && python -m pip install --requirement requirements.txt

# Install entr
USER root
RUN apk update
RUN apk add entr
USER python

WORKDIR /home/python/docs

# CMD []