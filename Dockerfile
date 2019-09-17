FROM openjdk:8

ARG BAZEL_VERSION
ARG BAZEL_SHA256SUM

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
