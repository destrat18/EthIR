from argparse import ArgumentParser
import json, logging, pickle, os, shutil
from slither.slither import Slither
from slither_utils import generate_initial_state
import subprocess


COSTABS_PATH = '/tmp/costabs'

if __name__ == '__main__':

    logging.basicConfig(level=logging.INFO)
    
    parser = ArgumentParser()
    parser.add_argument("-s", "--source", help="Solidity file")
    parser.add_argument("-o", "--output", help="Output directory")
    args = parser.parse_args()
    
    contract_address = os.path.basename(args.source).replace(".sol", "")
    meta = {}
    
    # create output directory
    if not args.output:
        args.output = os.path.dirname(args.source)
    else:
        args.output = os.path.join(args.output, contract_address)

    if os.path.exists(os.path.join(args.output, contract_address+".meta")):
        print("meta file exists! I'm Done!")
        exit()

    os.makedirs(args.output, exist_ok=True)

    # generate rbr
    subprocess.run(
        [
            'python', "ethir/ethir.py",
            "-s", args.source
            ],
    )

    slither_obj = Slither(args.source)  
    for contract in slither_obj.contracts:
        try:
            contract_function_list = [func.full_name for func in contract.functions]

            # generate initial state
            contract_meta = {
                "function_list": contract_function_list
            }
            
            
            contract_meta['initial_state'] = generate_initial_state(contract)    

            # read function mapping    
            fun_map_file_path = os.path.join(COSTABS_PATH, contract.name+'.fun_map')
            with open(fun_map_file_path, 'rb') as handle:
                fun_map = pickle.load(handle)
                contract_meta['function_block_mapping'] = {
                    f_name:fun_map[f_name] for f_name in fun_map if f_name in contract_function_list
                } 
        
            # read call opcode names
            call_fun_file_path = os.path.join(COSTABS_PATH, contract.name+'.call_fun')
            with open(call_fun_file_path, 'rb') as handle:
                call_fun = pickle.load(handle)
                contract_meta['block_CALL_mapping'] = call_fun    
        
            meta[contract.name] = contract_meta
        except Exception as e:
            logging.error(e)

    # copy source file
    try:
        shutil.copy(
            args.source,
            os.path.join(args.output, os.path.basename(args.source))
        )
    except shutil.SameFileError:
        print("Don't need to copy source file!")

    # copy rbr files
    for f in os.listdir(COSTABS_PATH):
        if f.endswith('.rbr'):
            shutil.copy(
                os.path.join(COSTABS_PATH, f),
                os.path.join(args.output, f)
            )

    meta_output = os.path.join(
        args.output,
        os.path.basename(args.source).replace(".sol", ".meta")
    )
    with open(meta_output, 'w') as handle:
        json.dump(meta, handle, indent=4)
