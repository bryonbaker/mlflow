FROM registry.redhat.io/ubi8/ubi:latest

RUN dnf install -y python3.9 && \
    pip3 install --upgrade pip

ENV HOME=/home/mlflow
ENV USER=mlflow
ENV GROUP=mlflow
ENV PATH=$HOME/.local/bin:${PATH}

RUN groupadd -r mlflow && \
    useradd -r -m -g mlflow mlflow

USER mlflow

WORKDIR $HOME
RUN pip3 install mlflow

EXPOSE 5000

CMD mlflow doctor && \
    mlflow server
