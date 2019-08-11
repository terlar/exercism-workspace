import { add } from "../../src/math"

import * as test from "tape"

test("My math library should be able to add things correctly", t => {
  t.equal(7, add(3, 4))
  t.true(5 > 2 + 2)

  t.end()
})
