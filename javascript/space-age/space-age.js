const earthOrbitalPeriodSeconds = 31557600
const orbitalPeriodFactors = {
  earth:   1,
  mercury: 0.2408467,
  venus:   0.61519726,
  mars:    1.8808158,
  jupiter: 11.862615,
  saturn:  29.447498,
  uranus:  84.016846,
  neptune: 164.79132
}

const yearSeconds = (planet) => {
  return earthOrbitalPeriodSeconds * orbitalPeriodFactors[planet]
}

export const age = (planet, seconds) => {
  const yearWithDecimals = seconds / yearSeconds(planet)
  return Math.round(yearWithDecimals * 100) / 100
};
