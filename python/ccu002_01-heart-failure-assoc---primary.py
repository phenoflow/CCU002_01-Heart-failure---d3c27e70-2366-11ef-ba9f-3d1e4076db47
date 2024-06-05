# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"420300004","system":"snomedct"},{"code":"422293003","system":"snomedct"},{"code":"420913000","system":"snomedct"},{"code":"421704003","system":"snomedct"},{"code":"662g.","system":"snomedct"},{"code":"662f.","system":"snomedct"},{"code":"662h.","system":"snomedct"},{"code":"ZRad.","system":"snomedct"},{"code":"662i.","system":"snomedct"},{"code":"388D.","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-heart-failure-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-heart-failure-assoc---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-heart-failure-assoc---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-heart-failure-assoc---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
