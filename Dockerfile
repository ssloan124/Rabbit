FROM rocker/tidyverse:latest

ARG PYTHON_VER="3.7.3"

RUN apt-get update -qq && \
    apt-get upgrade -y

RUN apt-get install -y make build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget

RUN wget https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz  && \
    tar -xzvf Python-${PYTHON_VER}.tgz && \ 
    cd Python-${PYTHON_VER} && \ 
    ./configure --prefix=$HOME/opt/python-${PYTHON_VER} --enable-optimizations --enable-shared && \
    make  && \
    make install 

RUN apt-get install -y python3-pip

RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opt/python-${PYTHON_VER}/lib

COPY . .

RUN pip3 install -r requirements.txt

RUN R -e "install.packages('data.table',dependencies=TRUE, repos='http://cran.rstudio.com/')"\
    && R -e "install.packages('reticulate',dependencies=TRUE, repos='http://cran.rstudio.com/')"