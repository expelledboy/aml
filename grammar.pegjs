{
  function toJson(doc) {
    return doc
      .filter(x => x !== undefined)
      .map(([indent, key, value]) => ({
        indent: indent.length,
        key,
        value,
        isMap: value === null,
      }))
      .reduce((a,i) => {
        // find which map to store the current node
        let depth = 0;
        let reference = a.result;
        while (depth < i.indent) {
          reference = reference[a.maps[depth]]
          depth++;
        }

        if (i.isMap) {
          // save the position of the map in the tree
          a.maps[i.indent] = i.key;
          // insert a new object
          Object.assign(reference, { [i.key]: {} });
        } else {
          // insert the value
          Object.assign(reference, { [i.key]: i.value });
        }

        // we already mutated the accumulator
        return a;
      }, {
        maps: {},
        result: {},
      })
      .result;
  }
}

Start
  = WS? doc:(Line)+ WS?
  { return toJson(doc); }

Line
  = statment:Statement NewLine?
  { return statment; }
  / WS
  { return; }

Statement
  = indent:(Indent+)? key:Key "." value:Value?
  { return [indent || [], key, value]; }

Key
  = [a-zA-Z0-9-]+
  { return text(); }

Value
  = " " chars:Text
  { return chars.join(''); }

Indent
  = "."

NewLine
  = "\n"
  / "\r\n"
  / "\r"
  / "\u2028"
  / "\u2029"

Text
  = [^\n\r\f]+

Word "word"
  = [^ \t\n\r\f]+

WS "whitespace"
  = [ \t\r\n\f]+
