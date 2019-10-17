import { add } from "../../src/math"

import * as Lab from "@hapi/lab"
import { expect } from "@hapi/code"

export const lab = Lab.script()

lab.describe("My math library", () => {
  lab.test("adds things correctly", () => {
    expect(add(3, 4)).to.equal(7)
  })
})
