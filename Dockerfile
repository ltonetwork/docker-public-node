FROM registry.access.redhat.com/ubi7/python-36:latest
USER root

# Update image & install openjdk 1.8
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager java-1.8.0-openjdk-headless.x86_64 -y && rm -rf /var/cache/yum

# Install python
RUN pip3 install requests pyhocon pywaves==0.8.19 tqdm

ENV LTO_LOG_LEVEL="INFO"
ENV LTO_HEAP_SIZE="2g"
ENV LTO_CONFIG_FILE="/lto/configs/lto-config.conf"

COPY starter.py /lto-node/
COPY entrypoint.sh /lto-node/
COPY lto-public-all.jar /lto-node/
COPY lto-*.conf /lto-node/

VOLUME /lto
EXPOSE 6869 6868 6863
ENTRYPOINT ["/lto-node/entrypoint.sh"]
