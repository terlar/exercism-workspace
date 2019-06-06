const COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
];

function value(colors) {
  return colors.reverse().reduce((acc, color, idx) => {
    return acc + COLORS.indexOf(color) * 10 ** idx;
  }, 0);
}

module.exports = { value };
