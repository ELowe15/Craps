# Dice Game (Craps)

# Dice Game Module (DICE3)

## Overview

This Verilog-based dice game simulates a simple craps game. It rolls two dice, checks if the player wins, loses, or continues to roll, and displays the results. The game uses a state machine to manage different phases like "natural," "craps," or "point" rolls.

## Key Features

- **State Machine:** Manages states such as `start_st`, `win_st`, `lose_st`, and `the_point_st`.
- **Game Logic:** 
  - **Craps:** Loss on roll of 2, 3, or 12.
  - **Natural:** Win on roll of 7 or 11.
  - **Point:** Sets a point for other rolls, continuing until a 7 is rolled (lose) or the point is matched (win).
- **Outputs:** 
  - `sum_out`: Debug output showing dice sum.
  - `win`, `lose`: Signals for win or loss.
  - `HEX0`, `HEX1`: Display outputs for dice roll.

## Inputs

- **clk_main:** Main clock.
- **enter:** Signal to initiate a roll.
- **reset:** Resets the game.

## Folder Structure

Each component of the dice game is organized into its own folder for better modularity
Each Verilog module has an associated test bench to ensure proper functionality during simulation.

## Modules

### 1. Datapath Module
Controls dice rolls and game state based on user input. Uses:
- **LFSRs** for generating random numbers.
- **Num1To6** to convert random numbers into dice values (1–6).
- **Display** for 7-segment display output.
- **Adder** for calculating the sum of the dice.
- **Test Logic** for game conditions based on the dice sum.
- **Comparator** to check if the dice sum matches the point.

### 2. Adder Module
Performs 4-bit addition using the `LPM_ADD_SUB` megafunction, controlled by a clock enable signal.

### 3. Display Module
Controls two 7-segment displays (`HEX0`, `HEX1`) to show dice values (1–6), converting 4-bit dice values to appropriate display patterns.

### 4. Div Module
Performs unsigned division using Intel’s `LPM_DIVIDE` megafunction to divide an 8-bit numerator by a 4-bit denominator.

### 5. LFSR Module
Generates pseudo-random numbers for simulating dice rolls using feedback logic.

### 6. Num1To6 Module
Converts an 8-bit value into a valid dice number (1–6) using division to map the range.

### 7. Test_Logic Module
Checks the dice sum for specific outcomes (craps, natural, seven, etc.), triggering appropriate signals.

### 8. Compare1 Module
Compares two 4-bit values and outputs signals indicating whether they are equal or not, useful for condition checking.

## License

Licensed under the MIT License
