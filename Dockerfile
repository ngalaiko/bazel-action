FROM openjdk:8

LABEL name="Bazel Action"
LABEL maintainer="Nikita Galaiko"
LABEL version="0.29.0"
LABEL repository="https://github.com/ngalaiko/bazel-action"

LABEL com.github.actions.name="Bazel Action"
LABEL com.github.actions.description="Run Bazel commands"
LABEL com.github.actions.icon="box"
LABEL com.github.actions.color="green"

ENV BAZEL_VERSION=0.29.0
ENV BAZEL_SHA256SUM=509c9ed0ee197a0cc613b187f00810d35c5d8716dbfe574616b3e1206d8ea01f

RUN apt-get update && apt-get install -y \
        g++ \
        zlib1g-dev \
        bash-completion \
        patch \
        python3 \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    curl \
        --fail \
        --silent \
        --show-error \
        --location \
        --output bazel.deb \
        "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel_${BAZEL_VERSION}-linux-x86_64.deb" && \
    sha256sum bazel.deb && \
    echo "$BAZEL_SHA256SUM *bazel.deb" | sha256sum -c - && \
    dpkg -i bazel.deb && \
    rm bazel.deb

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
