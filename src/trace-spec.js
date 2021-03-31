const fs = require("fs");
const pegjs = require("pegjs");

const readFile = (filepath) =>
  fs.readFileSync(`${__dirname}/${filepath}`).toString();

const spec = readFile("../examples/spec.aml");
const grammar = readFile("../grammar.pegjs");
const parser = pegjs.generate(grammar, { trace: true });

console.log(spec);
console.log(parser.parse(spec));
