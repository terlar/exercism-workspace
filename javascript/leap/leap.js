export function isLeap(year) {
  const divisibleBy = x => year % x === 0;
  return divisibleBy(4) && (!divisibleBy(100) || divisibleBy(400));
}
