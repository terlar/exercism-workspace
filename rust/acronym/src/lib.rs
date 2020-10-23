pub fn abbreviate(phrase: &str) -> String {
    let chars: Vec<char> = " ".chars().chain(phrase.chars()).collect();

    chars
        .windows(2)
        .filter_map(|pair| {
            if is_abbrev_letter(pair[0], pair[1]) {
                Some(pair[1])
            } else {
                None
            }
        })
        .collect::<String>()
        .to_uppercase()
}

fn is_abbrev_letter(prev: char, curr: char) -> bool {
    curr.is_alphanumeric() && match prev {
        ' ' | '_' | '-' => true,
        _ => curr.is_uppercase() && prev.is_lowercase()
    }
}
