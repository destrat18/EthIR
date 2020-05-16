import os
import csv
import sys

def check_csvfile_exist():
    files = os.listdir(".")
    if "result_final_constant.csv" not in files:
        f = open("result_final_constant.csv","a")
        fp = csv.writer(f, delimiter=',')
        fp.writerow(["File Name", "Contract Name", "Function Name", "Num Block", "Bound"])
        f.close()

def get_error_files(d):
    files = os.listdir(d)
    l = []
    for e in files:
        ext = e.split(".")[-1]
        if ext == "evm":
            l.append(e)
    l_end_aux = map(lambda x : x.split(":")[0],l)
    l_end = remove_duplicates(l_end_aux)
    return l_end

def remove_duplicates(l):
    result = []
    for e in l:
        if e not in result:
            result.append(e)
    return result

def get_new_file(fp,sol_files,csv_file):
    f = open(csv_file,"r")
    lines = f.readlines()[1:]
    # contract_files = map(lambda x: x.split(",")[0].strip(), lines)
    f.close()

    for e in lines[1:]:
        c_name = e.split(",")[0].strip()
        if c_name in sol_files:
            value = e.split(",")
            pos1 = e.find("rbr")
            pos2 = e.find(")")
            pos3 = e.find("UB",pos2)
            print e[pos3:-3]
            fp.writerow([value[0],value[1],e[pos1+4:pos2+1].strip(","),e[pos2+2:pos3-1].strip(","),e[pos3:-3].strip('"')])
        
if __name__ == '__main__':

    csv_file = sys.argv[1] #"result.csv"
    
    check_csvfile_exist()
    
    dir_cfile = "../../examples/code/constant/"
    new_dir = "../../examples/code/analyzed_constant/"

#    sol_files = get_error_files(new_dir)
    f1 = open("result_drive.csv","r")
    l = f1.readlines()[1:]
    sol_files = []
    for e in l:
        name = e.split(",")[0]
        if name not in sol_files:
            sol_files.append(name)
    f = open("filter_final_constant.csv","a")
    fp = csv.writer(f, delimiter=',')
    get_new_file(fp,sol_files,csv_file)
                    
            # os.rename(dir_cfile+cfile,new_dir+cfile)
                

    f.close()

