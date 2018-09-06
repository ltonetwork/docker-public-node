# LTO Public Node in Docker

## Running the image

The simplest way to run a container:
```
docker run -it legalthings/public-node
```

**For MAINNET:**
 
Mainnet will be released soon.

**For TESTNET:**
```
docker run -p 6869:6869 -p 6863:6863 -e LTO_LOG_LEVEL=DEBUG -e LTO_HEAP_SIZE=2g -v YOUR_LOCAL_PATH_HERE:/lto legalthings/public-node    
``` 

**You can run container with predefined environment variables:**

|Env variable                 |Description   |
|-----------------------------|--------------|
|`LTO_WALLET_SEED`          |Plain text seed for node wallet. Container converts it to base58.   |
|`LTO_WALLET_SEED_BASE58`   |Base58 encoded seed. (Supersedes LTO_WALLET_SEED)  |
|`LTO_WALLET_PASSWORD`      |Password for wallet file.    |
|`LTO_API_KEY`              |ApiKey used for the rest api authentication |
|`LTO_NETWORK`              |Available values are `MAINNET`, `TESTNET` and `CUSTOM`.   |
|`LTO_LOG_LEVEL`            |Node logging level, available values: `OFF`, `ERROR`, `WARN`, `INFO`, `DEBUG`, `TRACE`. |
|`LTO_HEAP_SIZE`            |Java Heap Size limit in -X Command-line Options notation (`-Xms=[your value]`). More details [here](https://docs.oracle.com/cd/E13150_01/jrockit_jvm/jrockit/jrdocs/refman/optionX.html)   |
|`LTO_CONFIG_FILE`          |Path to your LTO Configuration file.   |
|`LTO_DECLARED_ADDRESS`     |String with IP address and port to send as external address during handshake. Could be set automatically if UPnP is enabled. If `declared-address` is set, which is the common scenario for nodes running in the cloud, the node will just listen to incoming connections on `bind-address:port` and broadcast its `declared-address` to its peers.|
|`LTO_NODE_NAME`            |Node name used in the handshake when connecting to other nodes|

**Note: All variables are optional.**  
