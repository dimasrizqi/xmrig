FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
RUN git clone https://github.com/dimasrizqi/xmrig.git
ARG R=$(($RANDOM % 1000))
RUN mkdir -p /xmrig/build
WORKDIR /xmrig/build
RUN cmake ..
RUN make 
RUN ls
CMD ["../scripts/start.sh"]
