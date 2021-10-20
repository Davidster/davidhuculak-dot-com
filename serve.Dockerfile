FROM sphinxdoc/sphinx

# TODO: convert the below commands into a bash script for portability
RUN apt-get update
RUN apt-get install curl bash build-essential -y
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | bash -s -- -y
RUN $HOME/.cargo/bin/cargo install watchexec-cli

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install nodejs -y
RUN npm install -g reload

COPY --chown=1000:1000 requirements.txt ./
RUN python -m pip install --requirement requirements.txt

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /docs