ARG VARIANT=noble
FROM docker.io/library/ubuntu:$VARIANT

RUN apt-get update \
    && apt-get install --no-install-recommends --assume-yes \
    sudo \
    locales \
    ca-certificates \
    curl \
    zip \
    unzip && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    apt-get clean && rm -fr /var/lib/apt/lists/*

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --gid $USER_GID \
    --create-home $USERNAME \
    --shell /bin/bash \
    --uid $USER_UID \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME


SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install --no-install-recommends --assume-yes \
    curl \
    && curl -s "https://get.sdkman.io" | bash \
    # shellcheck source $HOME/.sdkman/bin/sdkman-init.sh
    && source "$HOME/.sdkman/bin/sdkman-init.sh" \
    && apt-get clean && rm -fr /var/lib/apt/lists/*
