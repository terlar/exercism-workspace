extern crate time;
use time::*;

// Returns a PrimitiveDateTime one billion seconds after start.
pub fn after(start: PrimitiveDateTime) -> PrimitiveDateTime {
    start + Duration::seconds(1_000_000_000)
}
