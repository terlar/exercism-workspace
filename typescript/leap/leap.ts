function isLeapYear(year: number): boolean {
    const divisibleBy = (x: number): boolean => year % x === 0
    if (divisibleBy(400)) { return true }
    if (divisibleBy(100)) { return false }
    return divisibleBy(4)
}

export default isLeapYear
