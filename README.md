# Dandruff Scratching Minigame

A small GameMaker prototype where you scratch a character's scalp with your cursor and watch the dandruff fly.

Hold the left mouse button and scrub back and forth over the character's head. The faster you scrub, the more flakes come loose.

<img width="716" height="772" alt="ScreenRecording2026-08-14at7 09 03PM-ezgif com-crop (1)" src="https://github.com/user-attachments/assets/00c3e407-2b4e-4e91-a23b-ba00ade3fb9f" />


## Requirements

- [GameMaker](https://gamemaker.io/) IDE `2024.14.3.217` or newer

## Running the project

1. Clone the repo:
   ```
   git clone https://github.com/jacksonsheu/dandruff-scratching-minigame.git
   ```
2. Open `scratch_game.yyp` in the GameMaker IDE.
3. Press **Run** (F5).

## Project structure

```
objects/
  obj_cursor/             Custom hand cursor that follows the mouse
  obj_person/             The character being scratched
  obj_scratchable_area/   Invisible hitboxes over the scalp; drives the game loop
  obj_dandruff/           A single falling flake
scripts/
  chance/                 1-in-n random roll helper
  makeParticle/           Spawns a burst of dandruff instances
sprites/                  Art for the cursor, character, flakes, and hitboxes
sounds/
  snd_scratch/            Looping scratch sound effect
rooms/
  Room1/                  The only room; the whole game
```

