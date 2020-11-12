FROM gitpod/workspace-full

RUN sudo apt-get install -y clang-format-10 libcmocka-dev && \
    sudo rm -rf /var/cache/apt/archives/*
