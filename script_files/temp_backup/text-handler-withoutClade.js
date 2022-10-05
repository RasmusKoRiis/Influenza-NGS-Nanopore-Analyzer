let csv = require('jquery-csv');
var fs = require('fs');
const path = process.cwd();

let H3 = fs.existsSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_HA_Norway_mutations.csv")
let H1 = fs.existsSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_HA_Switzerland_mutations.csv")

if (H3) {

    let csv_file = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_HA_Norway_mutations.csv", "utf8");
    let csv_file2 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_HA_Cambodia_mutations.csv", "utf8");
    let csv_file5 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_HA_Norway_NO_SEP_mutations.csv", "utf8");
    let csv_file7 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_NA_Norway_mutations.csv", "utf8");
    let csv_file9 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_MP_Norway_mutations.csv", "utf8");
    let csv_file11 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H3_MP2_Norway_mutations.csv", "utf8");


    const JSONfile = csvToJSON(csv_file);

    const CSVfile = ConvertToCSV(JSONfile);
    
    const JSONfile2 = csvToJSON(csv_file2);
    
    const CSVfile2 = ConvertToCSV(JSONfile2);

    const JSONfile5 = csvToJSON_noSep(csv_file5);
    
    const CSVfile5 = ConvertToCSV(JSONfile5);

    const JSONfile7 = csvToJSON_NA(csv_file7);
    
    const CSVfile7 = ConvertToCSV(JSONfile7);

    const JSONfile9 = csvToJSON_MP(csv_file9);
    
    const CSVfile9 = ConvertToCSV(JSONfile9);

    const JSONfile11 = csvToJSON_MP2(csv_file11);
    
    const CSVfile11 = ConvertToCSV(JSONfile11);

    fs.appendFile('H3_HA_Norway_mutations_toBN.csv',CSVfile, (err) => {
        if (err)
          console.log(err);
        else {
          console.log("H3 HA Norway mutation table: Success!\n");
          
        }
    });
    
    fs.appendFile('H3_HA_Cambodia_mutations_toBN.csv',CSVfile2, (err) => {
        if (err)
          console.log(err);
        else {
          console.log("H3 HA Cambodia mutation table: Success!\n");
          
        }
    });

    fs.appendFile('H3_HA_Norway_NO_SEP_mutations_toBN.csv',CSVfile5, (err) => {
        if (err)
          console.log(err);
        else {
          console.log("H3 HA Norway NO SEP mutation table: Success!\n");
          
        }
    });

    fs.appendFile('H3_NA_Norway_mutations_toBN.csv',CSVfile7, (err) => {
        if (err)
          console.log(err);
        else {
          console.log("H3 NA Norway mutation table: Success!\n");
          
        }
    });

    fs.appendFile('H3_MP_Norway_mutations_toBN.csv',CSVfile9, (err) => {
        if (err)
          console.log(err);
        else {
          console.log("H3 MP Norway mutation table: Success!\n");
          
        }
    });

    fs.appendFile('H3_MP2_Norway_mutations_toBN.csv',CSVfile11, (err) => {
        if (err)
          console.log(err);
        else {
          console.log("H3 MP2 Norway mutation table: Success!\n");
          
        }
    });

  } else {
    console.log("Zero H3 sequences included in analysis");
  };

if (H1) {

    let csv_file3 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_HA_Switzerland_mutations.csv", "utf8");
    let csv_file4 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_HA_Switzerland_Vaks_mutations.csv", "utf8");
    let csv_file6 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_HA_Switzerland_NO_SEP_mutations.csv", "utf8");
    let csv_file8 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_NA_Switzerland_mutations.csv", "utf8");
    let csv_file10 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_MP_Switzerland_mutations.csv", "utf8");
    let csv_file12 = require("fs").readFileSync("/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/H1_MP2_Switzerland_mutations.csv", "utf8");


    const JSONfile3 = csvToJSON(csv_file3);

    const CSVfile3 = ConvertToCSV(JSONfile3);

    const JSONfile4 = csvToJSON(csv_file4);

    const CSVfile4 = ConvertToCSV(JSONfile4);

    const JSONfile6 = csvToJSON_noSep(csv_file6);

    const CSVfile6 = ConvertToCSV(JSONfile6);

    const JSONfile8 = csvToJSON_NA(csv_file8);
    
    const CSVfile8 = ConvertToCSV(JSONfile8);

    const JSONfile10 = csvToJSON_MP(csv_file10);
    
    const CSVfile10 = ConvertToCSV(JSONfile10);

    const JSONfile12 = csvToJSON_MP2(csv_file12);
    
    const CSVfile12 = ConvertToCSV(JSONfile12);



    fs.appendFile('H1_HA_Switzerland_mutations_toBN.csv',CSVfile3, (err) => {
        if (err)
        console.log(err);
        else {
        console.log("H1 HA Switzerland mutation table: Success!\n");
        
        }
    });

    fs.appendFile('H1_HA_Switzerland_Vaks_mutations.csv_toBN.csv',CSVfile4, (err) => {
        if (err)
        console.log(err);
        else {
        console.log("H1 HA Switzerland Vac mutation table: Success!\n");
        
        }
    });

    fs.appendFile('H1_HA_Switzerland_NO_SEP_mutations_toBN.csv',CSVfile6, (err) => {
        if (err)
            console.log(err);
        else {
            console.log("H1 HA Switzerland mutation table: Success!\n");
        
        }
    });

    fs.appendFile('H1_NA_Switzerland_mutations_toBN.csv',CSVfile8, (err) => {
        if (err)
        console.log(err);
        else {
        console.log("H1 NA Switzerland mutation table: Success!\n");
        
        }
    });

    fs.appendFile('H1_MP_Switzerland_mutations_toBN.csv',CSVfile10, (err) => {
        if (err)
        console.log(err);
        else {
        console.log("H1 MP Switzerland mutation table: Success!\n");
        
        }
    });

    fs.appendFile('H1_MP2_Switzerland_mutations_toBN.csv',CSVfile12, (err) => {
        if (err)
        console.log(err);
        else {
        console.log("H1 MP2 Switzerland mutation table: Success!\n");
        
        }
    });
    

  } else {
    console.log("Zero H1 sequences included in analysis");
  };;





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
        result1[x][1] = result1[x][1].split(",");
    }

    for (y=0; y< result1.length; y++) {
        let obj = {
            Sample: "",
            HA1: [],
            HA2: [],
            SigPep: []
        };
        obj.Sample = result1[y][0];
        for (w=0; w<result1[y][1].length; w++) {
            if (result1[y][1][w].includes("HA1")){
                obj.HA1.push(result1[y][1][w]);
            } else if (result1[y][1][w].includes("HA2")){
                obj.HA2.push(result1[y][1][w]);
            } else if (result1[y][1][w].includes("SigPep")){
                obj.SigPep.push(result1[y][1][w]);
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

function csvToJSON_noSep(csv) {
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
        result1[x][1] = result1[x][1].split(",");
    }

    for (y=0; y< result1.length; y++) {
        let obj = {
            Sample: "",
            HA1: [],

        };
        obj.Sample = result1[y][0];
        for (w=0; w<result1[y][1].length; w++) {
            if (result1[y][1][w].includes("HA1")){
                obj.HA1.push(result1[y][1][w]);
            } 
        }
        mutationsObject.push(obj);
    }

    
    for (a = 0; a < mutationsObject.length; a++){
        for (b = 0; b < mutationsObject[a].HA1.length; b++){
            mutationsObject[a].HA1[b] = mutationsObject[a].HA1[b].replace("HA1:", "");
        }
    }
    
    return mutationsObject;

}

function csvToJSON_NA(csv) {
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
        result1[x][1] = result1[x][1].split(",");
    }

    for (y=0; y< result1.length; y++) {
        let obj = {
            Sample: "",
            NA: []
        };
        obj.Sample = result1[y][0];
        for (w=0; w<result1[y][1].length; w++) {
            if (result1[y][1][w].includes("NA")){
                obj.NA.push(result1[y][1][w]);
            } 
        }
        mutationsObject.push(obj);
    }

    
    for (a = 0; a < mutationsObject.length; a++){
        for (b = 0; b < mutationsObject[a].NA.length; b++){
            mutationsObject[a].NA[b] = mutationsObject[a].NA[b].replace("NA:", "");
        }
    }
    
    return mutationsObject;

}

function csvToJSON_MP(csv) {
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
        result1[x][1] = result1[x][1].split(",");
    }

    for (y=0; y< result1.length; y++) {
        let obj = {
            Sample: "",
            MA: []
        };
        obj.Sample = result1[y][0];
        for (w=0; w<result1[y][1].length; w++) {
            if (result1[y][1][w].includes("MA")){
                obj.MA.push(result1[y][1][w]);
            } 
        }
        mutationsObject.push(obj);
    }

    
    for (a = 0; a < mutationsObject.length; a++){
        for (b = 0; b < mutationsObject[a].MA.length; b++){
            mutationsObject[a].MA[b] = mutationsObject[a].MA[b].replace("MA:", "");
        }
    }
    
    return mutationsObject;

}

function csvToJSON_MP2(csv) {
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
        result1[x][1] = result1[x][1].split(",");
    }

    for (y=0; y< result1.length; y++) {
        let obj = {
            Sample: "",
            MA2: []
        };
        obj.Sample = result1[y][0];
        for (w=0; w<result1[y][1].length; w++) {
            if (result1[y][1][w].includes("MA2")){
                obj.MA2.push(result1[y][1][w]);
            } 
        }
        mutationsObject.push(obj);
    }

    
    for (a = 0; a < mutationsObject.length; a++){
        for (b = 0; b < mutationsObject[a].MA2.length; b++){
            mutationsObject[a].MA2[b] = mutationsObject[a].MA2[b].replace("MA2:", "");
        }
    }
    
    return mutationsObject;

}