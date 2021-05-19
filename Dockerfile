FROM ubuntu

WORKDIR /blockchain/mainnet/theta/node

RUN apt-get update && apt-get install -y curl

RUN curl -k --output /usr/local/bin/theta `curl -k 'https://mainnet-data.thetatoken.org/binary?os=linux&name=theta'` && \
    chmod +x /usr/local/bin/theta && \
    theta version

RUN curl -k --output /usr/local/bin/thetacli `curl -k 'https://mainnet-data.thetatoken.org/binary?os=linux&name=thetacli'` && \
    chmod +x /usr/local/bin/thetacli && \
    thetacli version
    
RUN curl -k -o snapshot https://mainnet-data.thetatoken.org/snapshot && \
    ls -la snapshot

RUN curl -k -o config.yaml "https://mainnet-data.thetatoken.org/config?is_guardian=true" && \
    ls -la config.yaml && \
    cat config.yaml

CMD [ "theta", "start", "--config=/blockchain/mainnet/theta/node", "--password=$${NODE_PASSWORD}" ]
