const earthYearSeconds = 31557600;
const orbitalPeriodInEarthYears = {
  earth: 1,
  mercury: 0.2408467,
  venus: 0.61519726,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132,
};

const round = (number, precision) => {
  const power = 10 ** precision;
  return Math.round(number * power) / power;
};

const orbitalPeriodInEarthYearSecondsFor = (planet) => {
  return earthYearSeconds * orbitalPeriodInEarthYears[planet];
};

export const age = (planet, seconds) => {
  const earthYear = seconds / orbitalPeriodInEarthYearSecondsFor(planet);
  return round(earthYear, 2);
};
