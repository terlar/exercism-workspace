#![feature(int_roundings)]

use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes: i32 = (hours * 60) + minutes;
        let actual_hours = total_minutes.div_floor(60);
        let actual_minutes = total_minutes - (actual_hours * 60);

        Self {
            hours: actual_hours,
            minutes: actual_minutes,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        unimplemented!("Add {} minutes to existing Clock time", minutes);
    }
}
