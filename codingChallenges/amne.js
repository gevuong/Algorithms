const fs = require('fs')
var arr = []
const inputData = fs.readFileSync('./input.txt', 'utf-8').split("\n").forEach(line => (
  arr.push(line.split(" "))
))
console.log(arr);
// inputData.forEach(str => (
//   str.split("[0-9]")
// ))

// var res = /\s*\n/
// console.log(inputData);
// console.log(inputData.split(res));
// console.log(inputData.split("\n"))
var numOfDays;
var windowSize;
var homeSalePrices;



// function readTextFile(file) {
//   var rawFile = new XMLHttpRequest();
//   rawFile.open('GET', file, false);
//   rawFile.onreadystatechange = function () {
//     if(rawFile.readyState === 4) {
//       if(rawFile.status === 200 || rawFile.status == 0) {
//         var allText = rawFile.responseText;
//         alert(allText);
//       }
//     }
//   }
//   rawFile.send(null);
// }
//
// console.log(readTextFile("file:///Users/GeorgeV./Desktop/Algorithms/codingChallenges/input.txt"));
