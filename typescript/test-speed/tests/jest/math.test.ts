import { add } from "../../src/math"

describe("My math library", () => {
  it("should be able to add things correctly", () => {
    expect(add(3, 4)).toEqual(7)
  })
})
