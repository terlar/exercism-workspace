import { add } from "../../src/math"

import test from "ava"

test("My math library should be able to add things correctly", t => {
  t.is(add(3, 4), 7)
  t.true(5 > 2 + 2)
})
