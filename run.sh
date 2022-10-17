name="$1";
# rm -r /tmp/costabs/*;
./ethir/ethir.py -e -s samples/$name/$name.sol;
if [[ `ls -1 /tmp/costabs/ | wc -l` -gt 0 ]]
then
    cp /tmp/costabs/*.rbr samples/$name/;
    cp /tmp/costabs/*.fun_map samples/$name/;
    python3 helper.py --action generate_summary -f "samples/$name/$name.sol";
    
    while read -r c_name; do
        python3 helper.py --action generate_init_state -c $c_name -f "samples/$name/$name.sol";
        python3 helper.py --action fix_fun_map -c $c_name -f "samples/$name/$name.sol";
    done <<< "$(awk -F"," 'FNR == 2 {print $2}' samples/$name/$name.summary | uniq)"

    # rm -r /tmp/costabs/*;
fi