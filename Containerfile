FROM registry.redhat.io/ubi8/ubi:latest

ENV HOME=/home/mlflow
ENV USER=mlflow
ENV GROUP=mlflow
ENV APPS=/mlflow
ENV PATH=$HOME/.local/bin:${PATH}

RUN dnf install -y python3.9 && \
    pip3 install --upgrade pip

# Create a user but do not create a home directory
# Set the work directory to be in the root group
RUN useradd -r -m -g root $USER && \
    chgrp -R 0 $HOME && \
    chmod -R g+rwX $HOME
WORKDIR $HOME

USER $USER
RUN pip3 install mlflow

USER root
RUN chmod -R g+rwX $HOME

USER $USER

EXPOSE 5500

CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5500"]
