import fetch from 'node-fetch';

const url = "https://www.hvakosterstrommen.no/api/v1/prices/2022/10-04_NO5.json"

const response = await fetch(url);
const data = await response.json();

console.log(data);