const gigasecondInMs = 10 ** 9 * 1000;

export function gigasecond(date) {
  return new Date(date.getTime() + gigasecondInMs);
}
