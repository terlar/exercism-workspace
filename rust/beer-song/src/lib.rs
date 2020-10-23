pub fn verse(verse: i8) -> String {
    match verse {
        0 => {
            "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n".into()
        }
        1 => {
            "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n".into()
        }
        2 => {
            "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n".into()
        }
        _ => {
            format!(
                "{current} bottles of beer on the wall, {current} bottles of beer.\nTake one down and pass it around, {remaining} bottles of beer on the wall.\n",
                current = verse,
                remaining = verse - 1
            )
        }
    }
}

pub fn sing(start: i8, stop: i8) -> String {
    (stop..start + 1)
        .rev()
        .map(|i| verse(i))
        .collect::<Vec<_>>()
        .join("\n")
}