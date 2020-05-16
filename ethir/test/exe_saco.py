import shlex
import subprocess
import os
import csv
import sys

def run_command(cmd):
    FNULL = open(os.devnull, 'w')
    solc_p = subprocess.Popen([cmd], stdout=subprocess.PIPE, stderr=FNULL)
    return solc_p.communicate()[0].decode()


def get_num_blocks(name):
    if name.split(".")[1] == "rbr":
        l = name.split("_")[0]
        config_name = l+".config"
        f = open(config_name,"r")
        signature = f.readlines()
        blocks = map(lambda x: (x.split(";")[0].strip()[1:],x.split(";")[1].strip()),signature)
        return blocks
    else:
        return -1

def saco(name, block):
    ub_m = "Oyente fails"
    ub_g = "Oyente fails"
    r = {}
    
    cmd = "/home/pablo/Systems/costa/costabs/src/interfaces/shell/costabs "+"/tmp/costabs/"+name+" -entries block"+block+" -cost_model gas -ethir yes"
    result = subprocess.Popen([cmd], stdout = subprocess.PIPE, shell = True)
    a = result.communicate()[0].decode()
    lines = a.split("\n")
    size_time = 0
    crs_time = 0
    pubs_time = 0
    for l in lines:
        if l != "":
            words = l.split()

            if words[0] == "GASTAP" and words[1] == "Gas":
                r["memory"]=(size_time,crs_time,pubs_time)
            elif words[0] == "Size" and words[1] == "analysis":
                size_time = words[-2]
            elif words[0] == "Cost" and words[1] == "equations":
                crs_time = words[-2]
            elif "PUBS" in words:
                pubs_time = words[-2]
            elif words[0] == "UB" and words[2] == "memory":
                ub_m = l
            elif words[0] == "UB" and words[2] != "memory":
                ub_g = l
    r["gas"] = (size_time,crs_time,pubs_time)
    return r,(ub_m,ub_g)
    
def check_csvfile_exist():
    files = os.listdir(".")
    if "result_final_constant.csv" not in files:
        f = open("result_final_constant.csv","a")
        fp = csv.writer(f, delimiter=',')
        fp.writerow(["File Name", "Contract Name", "Function Name", "Num Block", "Memory Bound", "Gas Bound"])
        f.close()

def check_timefile_exist():
    files = os.listdir(".")
    if "times_saco.csv" not in files:
        f = open("times_saco.csv","a")
        fp = csv.writer(f, delimiter=',')
        fp.writerow(["Memory Size", "CRS Memory", "PUBS Size", "Gas Size", "CRS Gas","PUBS Gas"])
        f.close()
        
def get_rbr_files():
    f = open("result_final_constant.csv","r")
    lines = f.readlines()[1:]
    contract_files = map(lambda x: (x.split(",")[0].strip(),x.split(",")[2].strip()), lines)
    f.close()
    return contract_files

def statistics(contract_file,name,block,bound,fp):
    bound_m = bound[0]
    bound_g = bound[1]
    
    if bound_m == "":
        ub_m = "No"
    else :
        ub_m = bound_m

    if bound_g == "":
        ub_g = "No"
    else :
        ub_g = bound_g
        
    fp.writerow([contract_file, name, block[0], block[1], ub_m, ub_g])

def write_time(times):
    f = open("times_saco.csv","a")
    fp = csv.writer(f, delimiter=',')
    memory = times["memory"]
    gas = times["gas"]
    fp.writerow([memory[0],memory[1],memory[2],gas[0],gas[1],gas[2]])
    f.close()
    
if __name__ == '__main__':

    cfile = sys.argv[1] #"four_functions.sol"
    name = sys.argv[2] #"Sum_saco.rbr"
    
    check_csvfile_exist()
    check_timefile_exist()
    
    dir_cfile = "../../examples/code/constant/"
    new_dir = "../../examples/code/analyzed_constant/"
    contract_files = get_rbr_files()

    f = open("result_final_constant.csv","a")
    fp = csv.writer(f, delimiter=',')

    d = "/tmp/costabs/"+name
    if name != "cfg":
        v =  get_num_blocks(d)
        if v != -1:
            
            for b in v:
                if (cfile,b[0]) not in contract_files:
                    times, result = saco(name,b[1])
                    statistics(cfile,name,b,result,fp)
                    write_time(times)
            # os.rename(dir_cfile+cfile,new_dir+cfile)
                

    f.close()
