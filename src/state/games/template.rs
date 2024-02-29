use crate::scripter::file::File;

pub struct Game {
    pub name: String,

    // Shows an example for how the user will complete teh challenge
    pub instructions: String,

    // Gives the user the question for the script
    pub prompt: String,

    // Is checked against stdout in the scripter module
    pub answer: String,

    //Files to add for game init
    pub files: Vec<File>,
}
