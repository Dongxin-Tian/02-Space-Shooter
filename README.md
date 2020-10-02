# 02-Space-Shooter
Space shooter game

A 2D space shooter bullet hell game.
Control:  Arrow keys(↑ ↓ ← →) for moving.
          Shift for slow control.
          Z for shooting
          X for using bombs.
Features: Meteors will fall from the up side of the screen while enemy ships will try to
          shoot you with three types of attacking pattern(including aiming pattern, square pattern, and cross pattern).
          There are four statistics for the player, including power(determines how strong is the player's main weapon. Lower than 1.00 for only shooting one bullet once. Lower than 2.00 and higher than 1.00 for shooting two bullets once... Up to equal to 4.00, which shooting 5 bullets once), bombs(has high damage to enemies and obstacles, each use will cost 1 bomb), lives(starts with 3 lives, losing to 0 lives will lead to game over), and score(by destroying a meteor, the player can gain 100 score. By shooting down a enemy ship, the player can obtain 300 score).
          The player can obtain supplies by shooting down meteors and enemy ships. To be specific, there are three types of supplies, power up(increases player's power by 0.2), bomb up(increases player's bomb number by 1), and life up(gives player a life). By destroying meteors, a power up will definitely fall down. By shooting down enemy ships, there will be a high probability that it will drop nothing, a power up, or a bomb up. However, there is a 1/10 chance that it will drop a life up.
          Holding down shift for a much more precise movement in order to survive       in countless enemy bullets.
          The goal is to survive as long as possible. With the time goes, the max number of enemy ships on screen will increase until the player lose.

## Implementation
Built using Godot 3.2.2

## References
None

## Future Development
None

## Created by
Dongxin Tian