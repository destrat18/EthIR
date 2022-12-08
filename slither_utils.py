import os, csv

def generate_initial_state(contract):

    unit_list = ['uint', 'string', 'bytes']

    # for each contract in solidity file first we check state variables then for each func
    # we extract parameters if the are uint vriable
        
    contract_init_state = {}


    # check all state variables
    # TODO check if we need to be more accurate
    state_variables = {}
    for var in contract.state_variables_declared:
        for u in unit_list:
            if str(var.type).startswith(u) or "[]" in str(var.type):
                state_variables[var.name] = str(var.type)
                

            
    # check all parameters for each func in contract
    for func in contract.functions:
        
        if func.name in ['slitherConstructorVariables']:
            continue

        contract_init_state[func.full_name] = {'argument': {}, 'contract': state_variables}
        for var in func.parameters:
            # print(contract.name, func.full_name, var.name, var.type)
            for u in unit_list:
                if str(var.type).startswith(u) or "[]" in str(var.type):
                    contract_init_state[func.full_name]['argument'][var.name] = str(var.type)
                    if var.name == "" and str(var.type) == "bytes":
                        del  contract_init_state[func.full_name]['argument'][var.name]
                        contract_init_state[func.full_name]['argument']["bytes"] = str(var.type)
        
    return contract_init_state