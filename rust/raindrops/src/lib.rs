pub fn raindrops(number: i32) -> String {
    let mut s = String::from("");

    if number % 3 == 0 {
        s.push_str("Pling")
    }

    if number % 5 == 0 {
        s.push_str("Plang")
    }

    if number % 7 == 0 {
        s.push_str("Plong")
    }

    if s.is_empty() { number.to_string() } else { s }
}