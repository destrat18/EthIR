import os, csv

def generate_initial_state(contract):

    init_state = []

    unit_list = ['uint', 'string']

    # for each contract in solidity file first we check state variables then for each func
    # we extract parameters if the are uint vriable
        
    contract_init_state = {}


    # check all state variables
    # TODO check if we need to be more accurate
    state_variables = {}
    for var in contract.state_variables_declared:
        for u in unit_list:
            if u in str(var.type):
                state_variables[var.name] = u
            
    # check all parameters for each func in contract
    for func in contract.functions:
        
        if func.name in ['slitherConstructorVariables']:
            continue

        contract_init_state[func.full_name] = {'argument': {}, 'contract': state_variables}
        for var in func.parameters:
            for u in unit_list:
                if u in str(var.type):
                    contract_init_state[func.full_name]['argument'][var.name] = u
        
        init_state.append(contract_init_state)

    return init_state

def get_function_list(sol_file_path):

    slither = Slither(sol_file_path)  

    function_list = {}

    for contract in slither.contracts:
        function_list[contract.name] = [func.full_name for func in contract.functions]

    return function_list

def get_sol_summary(slither_obj):

    summary = []

    for contract in slither_obj.contracts:
        for func in contract.functions:
            summary.append([
                contract.name,
                func.full_name
            ])    

    return summary