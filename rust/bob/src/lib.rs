fn is_question(input: &str) -> bool {
    input.ends_with("?")
}

fn is_shouting(input: &str) -> bool {
    input.chars().any(char::is_alphabetic) && !input.chars().any(char::is_lowercase)
}

fn is_forceful_question(input: &str) -> bool {
    is_shouting(input) && is_question(input)
}

pub fn reply(input: &str) -> &'static str {
    match input.trim() {
        x if is_forceful_question(x) => "Calm down, I know what I'm doing!",
        x if is_question(x) => "Sure.",
        x if is_shouting(x) => "Whoa, chill out!",
        "" => "Fine. Be that way!",
        _ => "Whatever."
    }
}
