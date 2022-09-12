from argparse import ArgumentParser
import pickle, os, sys, logging, csv
logging.basicConfig(level=logging.INFO)
from slither_utils import get_init_state_from_contract, get_function_list, get_sol_summary

if __name__ == '__main__':


    parser = ArgumentParser()
    parser.add_argument("-f", "--file", dest="file_path", help="target/solidity file")
    parser.add_argument("-c", "--contract-name", dest="contract_name", help="contract name")
    parser.add_argument("-a", "--action", dest="action", help="generate_init_state, fix_fun_map")

    args = parser.parse_args()

    if args.action == 'generate_init_state':
        init_state = get_init_state_from_contract(args.file_path)
        init_state_file_path = os.path.join(os.path.dirname(args.file_path), args.contract_name+'.init_state')
        with open(init_state_file_path, 'wb') as handle:
            pickle.dump(init_state[0], handle)
            logging.info("the init state is stored at " + init_state_file_path)
            logging.debug("the init state is: \n" + str(init_state[0]))

    elif args.action == 'generate_summary':
        summary = get_sol_summary(args.file_path)
        with open(args.file_path.replace('.sol', '.summary'), 'w') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow(['file', 'contract', 'function'])
            for s in summary:
                csvwriter.writerow(s)

    elif args.action == 'fix_fun_map':
        fun_map_file_path = os.path.join(os.path.dirname(args.file_path), args.contract_name+'.fun_map')

        with open(fun_map_file_path, 'rb') as handle:
            fun_map = pickle.load(handle)
        
        function_list = get_function_list(args.file_path)[0]

        non_function_list = [func for func in fun_map if func not in function_list]
        
        for func in non_function_list:
            del fun_map[func]
        
        with open(fun_map_file_path, 'wb') as handle:
            pickle.dump(fun_map, handle)
        
        logging.info("fun_map of {} is updated, {} removed".format(fun_map_file_path, len(non_function_list)))
