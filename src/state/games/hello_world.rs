// I think this should be a struct with an attribute completed
// Instance of the struct

use crate::state::games::template::Game;

fn hello_world_construct() -> Game {
    let game = Game {
        name: "Hello World".to_string(),
        instructions: "
        Echo out hello world!, ex:\n
        Output = Hello world!"
            .to_string(),
        prompt: "Print hello world to the console.".to_string(),
        answer: "Hello World".to_string(),
        files: vec![],
    };
    return game;
}
