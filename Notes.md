# Lurch

## Engine

### Main loop

At each step (time event):

- Compute new positions of all sprites.
- Detect interactions of all sprites.  This can be done with computationally increasing complexity:
    - compute possible overlap via simple circle overlap. if none, stop.
    - compute via more sophisticated method (typeclass?): square/rectangle or custom.
- Create events from any interactions.

### Event loop

For each event:

- Modify game state
