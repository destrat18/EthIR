DATASET="$1"
OUTPUT="$2"

while read -r contract_address
do
    META=$OUTPUT/$contract_address/$contract_address.meta
    if [ -f $META ]; then
        echo "$contract_address.meta exists"
        continue
    fi
    echo "Processing $contract_address"
    python3 helper.py --source "$DATASET/$contract_address.sol" --output $OUTPUT
done < "$DATASET/contract_address.txt"