const fs = require("fs");
const parse = require("./index");

const spec = `
key. value
neighbourKey. true

siblingKey. true

map.
.prop. true
.neighbourProp. true
`;

test("can parse full specification", () => {
  expect(parse(spec)).toEqual({
    key: "value",
    neighbourKey: "true",
    siblingKey: "true",
    map: { prop: "true", neighbourProp: "true" },
  });
});
