OUTPUT="/workspaces/EthIR/samples/gastap_20k_batch"

while read -r contract_address
do
    META=$OUTPUT/$contract_address/$contract_address.meta
    if [ -f $META ]; then
        echo "$contract_address.meta exists"
        continue
    fi
    echo "Processing $contract_address"
    python3 helper.py --source "/workspaces/EthIR/examples/gastap_dataset/$contract_address.sol" --output $OUTPUT
done < "/workspaces/EthIR/samples/gastap_20k_batch/contract_address.txt"