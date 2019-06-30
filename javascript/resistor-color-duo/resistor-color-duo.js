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

export function value(colors) {
  return colors.reverse().reduce((acc, color, idx) => {
    return acc + COLORS.indexOf(color) * 10 ** idx;
  }, 0);
}
