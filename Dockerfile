FROM python:3.14.5-slim-trixie

ARG USERNAME=devuser
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    git \
    build-essential \
    curl \
    gettext \
    jq \
    ripgrep \
    fd-find \
    tree \
    lsd \
    less \
    coreutils \
    bash-completion \
    vim \
    wget \
    sudo  && \
    curl -Ls get.dannyb.co/rush/setup | bash && \
    mkdir -p /home/devuser/ && \
    git clone https://github.com/siavashoutadi/rush-repo.git /home/devuser/rush-repo && \
    rush add siavashoutadi /home/devuser/rush-repo && \
    rush get siavashoutadi:delta && \
    rush get siavashoutadi:yq && \
    rush get siavashoutadi:gh && \
    rush get siavashoutadi:viddy && \
    rush get siavashoutadi:bat && \
    rush get siavashoutadi:uv && \
    curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/download/v4.3.0/tailwindcss-linux-x64 && \
    chmod +x tailwindcss-linux-x64 && \
    mv tailwindcss-linux-x64 /usr/local/bin/tailwindcss && \
    curl -sS https://starship.rs/install.sh | sh -s -- --yes && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    apt-get clean

USER devuser

RUN mkdir -p /home/devuser/.bashrc.d/ /home/devuser/.config/git && \
    echo 'for f in ~/.bashrc.d/*; do source $f; done' >> /home/devuser/.bashrc && \
    echo '[ -f ./.env/devcontainer ] && source ./.env/devcontainer' >> /home/devuser/.bashrc && \
    echo 'PATH=$PATH:~/.local/bin' >> /home/devuser/.bashrc

COPY bashrc.d/* /home/devuser/.bashrc.d/
COPY config/git/config /etc/gitconfig
COPY config/git/ignore /home/devuser/.config/git/
COPY config/ripgrep/* /home/devuser/.config/
COPY config/starship/* /home/devuser/.config/

WORKDIR /home/devuser/workspace
