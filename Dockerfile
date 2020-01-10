FROM alpine/git as intermediate

RUN mkdir /usr/tmp
WORKDIR /usr/tmp

RUN git clone https://github.com/hyperledger/fabric-sdk-node

FROM sewenew/redis-protobuf

RUN mkdir -p /usr/lib/redis/proto
COPY --from=intermediate /usr/tmp/fabric-sdk-node/fabric-protos/protos /usr/lib/redis/proto