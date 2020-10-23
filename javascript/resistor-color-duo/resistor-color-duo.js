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

export function decodedValue(colors) {
  return colors.slice(0, 2).reverse().reduce((acc, color, idx) => {
    return acc + COLORS.indexOf(color) * 10 ** idx;
  }, 0);
}
