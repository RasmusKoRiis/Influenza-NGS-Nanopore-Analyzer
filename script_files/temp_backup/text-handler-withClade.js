let csv = require('jquery-csv');
var fs = require('fs');
const path = process.cwd();

let H3 = fs.existsSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_HA_Norway_mutations.csv")
let H1 = fs.existsSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_HA_Switzerland_mutations.csv")

function csvToJSON(csv) {
    var lines = csv.split("\n");
    var result1 = [];
    var result2 = [];
    let mutationsObject = [];
    
    var headers;
    headers = lines[0].split(",");

    for (i=1; i< lines.length; i++) {
        if(lines[i] == undefined || lines[i].trim() == "") {
            continue;
        }
    
        var currentline = lines[i].split("\t");
        result1.push(currentline);
    }

    

    for (x=0; x< result1.length; x++) {
        result1[x][2] = result1[x][2].split(",");
    }

    for (y=0; y< result1.length; y++) {
        let obj = {
            Sample: "",
            Clade: "",
            HA1: [],
            HA2: [],
            SigPep: []
        };
        obj.Sample = result1[y][0];
        obj.Clade = result1[y][1];
        for (w=0; w<result1[y][2].length; w++) {
            if (result1[y][2][w].includes("HA1")){
                obj.HA1.push(result1[y][2][w]);
            } else if (result1[y][2][w].includes("HA2")){
                obj.HA2.push(result1[y][2][w]);
            } else if (result1[y][2][w].includes("SigPep")){
                obj.SigPep.push(result1[y][2][w]);
            }
        }
        mutationsObject.push(obj);
    }

    
    for (a = 0; a < mutationsObject.length; a++){
        for (b = 0; b < mutationsObject[a].HA1.length; b++){
            mutationsObject[a].HA1[b] = mutationsObject[a].HA1[b].replace("HA1:", "");
        }
        for (b = 0; b < mutationsObject[a].HA2.length; b++){
            mutationsObject[a].HA2[b] = mutationsObject[a].HA2[b].replace("HA2:", "");
        }
        for (b = 0; b < mutationsObject[a].SigPep.length; b++){
            mutationsObject[a].SigPep[b] = mutationsObject[a].SigPep[b].replace("SigPep:", "");
        }
        
    }
    
    return mutationsObject;

}

function ConvertToCSV(objArray) {
    var array = typeof objArray != 'object' ? JSON.parse(objArray) : objArray;
    var str = '';
    
    

    for (var i = 0; i < array.length; i++) {
        var line = '';
        for (var index in array[i]) {
            if (line != '') line += ';'

            line += array[i][index];
        }

        str += line + '\r\n';
    }

    return str;
}

if (H3) {

    let csv_file1 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_HA_clade_mutations.csv", "utf8");
    const JSONfile1 = csvToJSON(csv_file1);
    const CSVfile1 = ConvertToCSV(JSONfile1);

    fs.appendFile('H3_HA_clade_mutations_toBN.csv',CSVfile1, (err) => {
        if (err)
          console.log(err);
        else {
          console.log("File written successfully\n");

        }
    });

} else {
    console.log("Zero H3 sequences included in analysis");
  };

if (H1) {

    let csv_file2 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_HA_clade_mutations.csv", "utf8");
    const JSONfile2 = csvToJSON(csv_file2);
    const CSVfile2 = ConvertToCSV(JSONfile2);

    fs.appendFile('H1_HA_clade_mutations_toBN.csv',CSVfile2, (err) => {
        if (err)
            console.log(err);
        else {
            console.log("File written successfully\n");
              
            }
        });    
    
} else {
    console.log("Zero H1 sequences included in analysis");
  };















