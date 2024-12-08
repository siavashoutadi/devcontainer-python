FROM python:3.13.1-slim-bullseye

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    git \
    build-essential \
    curl \
    jq \
    ripgrep \
    tree \
    wget && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb && \
    dpkg -i git-delta_0.18.2_amd64.deb && \
    rm -rf git-delta_0.18.2_amd64.deb && \
    wget https://github.com/alexellis/arkade/releases/download/0.11.31/arkade -O /usr/local/bin/arkade && \
    chmod +x /usr/local/bin/arkade && \
    arkade get \
    yq \
    gh \
    viddy && \
    mv $HOME/.arkade/bin/* /usr/local/bin/ && \
    rm -rf $HOME/.arkade/ && \
    cd /tmp && wget https://github.com/owenthereal/ccat/releases/download/v1.1.0/linux-amd64-1.1.0.tar.gz && \
    tar -xvzf linux-amd64-1.1.0.tar.gz && \
    mv linux-amd64-1.1.0/ccat /usr/local/bin && \
    chmod +x /usr/local/bin/ccat && \
    rm -rf /tmp/linux-amd64-1.1.0 &&\
    cd /tmp && wget https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd-v1.1.5-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xvzf lsd-v1.1.5-x86_64-unknown-linux-gnu.tar.gz && \
    mv lsd-v1.1.5-x86_64-unknown-linux-gnu/lsd /usr/local/bin && \
    chmod +x /usr/local/bin/lsd && \
    rm -rf lsd-v1.1.5-x86_64-unknown-linux-gnu && \
    cd /tmp && wget https://github.com/starship/starship/releases/download/v1.21.1/starship-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xvzf starship-x86_64-unknown-linux-gnu.tar.gz && \
    mv starship /usr/local/bin && \
    chmod +x /usr/local/bin/starship && \
    cd /tmp && wget https://github.com/astral-sh/uv/releases/download/0.5.6/uv-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xvzf uv-x86_64-unknown-linux-gnu.tar.gz && \
    chmod +x uv-x86_64-unknown-linux-gnu/* && \
    mv uv-x86_64-unknown-linux-gnu/* /usr/local/bin

RUN mkdir -p /root/.bashrc.d/ /root/.config/git && \
    echo 'for f in ~/.bashrc.d/*; do source $f; done' >> /root/.bashrc && \
    echo '[ -f ./.env/devcontainer ] && source ./.env/devcontainer' >> /root/.bashrc

COPY bashrc.d/* /root/.bashrc.d/
COPY config/git/config /etc/gitconfig
COPY config/git/ignore /root/.config/git/
COPY config/ripgrep/* /root/.config/
COPY config/starship/* /root/.config/
