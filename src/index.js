const parser = require("./parser.js");

module.exports = (string) => {
  try {
    return parser.parse(string);
  } catch (e) {
    if (e.name !== "SyntaxError") throw e;

    const { line, column } = e.location.start;

    throw new Error(
      [`Syntax error on line ${line} column ${column}`, e.message].join("\n")
    );
  }
};
