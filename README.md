# EthIR

To facilitate generating RBR and meta files for each solidity code using the original [EthIR GitHub repository](https://github.com/costa-group/EthIR), we create a Dockerfile that installs the exact version of solidity, python2.7, and libraries.

## Prerequisites
Install docker using offical [docker documents](https://docs.docker.com/engine/install/).


## Create the docker image
To generate the docker image use the command below
```
docker build -t ethir .
```

## Generate RBR and meta
the following command creates and runs the code on the solidity file in the same folder.

```
docker run -v PATH_TO_SOLIDITY:/EthIR/samples -it ethir python3 /EthIR/helper.py -s samples/SOLIDITY_SOURCE_CODE_NAME
```

For example you can generate .rbr and .meta for the voting example with the following command:

```
docker run -v /home/user/Desktop/Asparagus/illustration_examples/voting:/EthIR/samples -it ethir python3 /EthIR/helper.py -s samples/voting.sol
```

The `/home/user/Desktop/Asparagus/illustration_examples/voting` is the path to directory containg solidity file and `voting.sol` is the name of solidity source code.

### GASTAP Dataset
To run the code on the whole GASTAP dataset you instead of calling one by one, `run.sh` script can be used.

```
docker run -v /home/user/Desktop/Asparagus/dataset/gastap_dataset:/EthIR/gastap_dataset -it ethir bash /EthIR/run.sh gastap_dataset
```
