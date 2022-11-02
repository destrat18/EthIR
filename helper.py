from argparse import ArgumentParser
import json, logging
logging.basicConfig(level=logging.INFO)
from slither_utils import generate_initial_state, get_function_list, get_sol_summary
from slither.slither import Slither

if __name__ == '__main__':


    parser = ArgumentParser()
    parser.add_argument("-f", "--file", help="Solidity file")
    args = parser.parse_args()
    
    meta = {}
    slither_obj = Slither(args.file)  

    # generate the summery
    meta['summery'] = {}
    for contract in slither_obj.contracts:
        meta['summery'][contract.name] = []
        for func in contract.functions:
            meta['summery'][contract.name].append(str(func.full_name))    
  

    # generate initial state
    meta['initial_state'] = {}
    for contract in slither_obj.contracts:
        meta['initial_state'][contract.name] = generate_initial_state(contract)    
    
    meta_output = args.file.replace(".sol", ".meta")
    print(meta)
    with open(meta_output, 'w') as handle:
        json.dump(meta, handle, indent=4)
    
    # elif args.action == 'fix_fun_map':

    #     fun_map_file_path = os.path.join(os.path.dirname(args.file_path), args.contract_name+'.fun_map')
    #     with open(fun_map_file_path, 'rb') as handle:
    #         fun_map = pickle.load(handle)
        
    #     function_list = get_function_list(args.file_path)[0]

    #     non_function_list = [func for func in fun_map if func not in function_list]
        
    #     for func in non_function_list:
    #         del fun_map[func]
        
    #     with open(fun_map_file_path, 'wb') as handle:
    #         pickle.dump(fun_map, handle)
        
    #     logging.info("fun_map of {} is updated, {} removed".format(fun_map_file_path, len(non_function_list)))
