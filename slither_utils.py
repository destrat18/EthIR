from slither.slither import Slither
import os, csv

def get_init_state_from_contract(sol_file_path):
    """
    extract all uint variable from solidity smart contract. for each contract in solidity file,
    first we check state variables then for each func we check parameters and return them
    if they are uint

    for using this function you need solidity compiler

    Args:
        sol_file_path (str): path to solidity file

    Returns:
        for each function returns arguemtns and contracts like 
        {'func3(uint256)': {'argument': {'k': '>=0'}, 'contract': {'j': '>=0'}}}
        in func3, argument k>=0 (uint), contract variable j>=0 (uint)
    """

    init_state = []

    slither = Slither(sol_file_path)  

    # for each contract in solidity file first we check state variables then for each func
    # we extract parameters if the are uint vriable
    for contract in slither.contracts:
        
        contract_init_state = {}


        # check all state variables
        # TODO check if we need to be more accurate
        state_variables = {}
        for var in contract.state_variables_declared:
            if str(var.type).startswith('uint'):
                state_variables[var.name] = ">=0"
                
        # check all parameters for each func in contract
        for func in contract.functions:
            
            if func.name in ['slitherConstructorVariables']:
                continue

            contract_init_state[func.full_name] = {'argument': {}, 'contract': state_variables}
            for var in func.parameters:
                if str(var.type).startswith('uint'):
                   contract_init_state[func.full_name]['argument'][var.name] = ">=0"
        
        init_state.append(contract_init_state)

    return init_state

def get_function_list(sol_file_path):

    slither = Slither(sol_file_path)  

    function_list = []

    for contract in slither.contracts:
        function_list.append([func.full_name for func in contract.functions])

    return function_list

def get_sol_summary(sol_file_path):

    slither = Slither(sol_file_path)  

    summary = []

    for contract in slither.contracts:
        for func in contract.functions:
            summary.append([
                os.path.basename(sol_file_path),
                contract.name,
                func.full_name
            ])    

    return summary