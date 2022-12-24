// ignore_for_file: avoid_print

import 'dart:io';

import 'game.dart';

void main() {
  late GuessResult guessResult;
  String? again = 'Y';
  var game;
  do {
    if (again == 'Y' || again == 'y') {
      stdout.write('Enter a max number to random : ');
      var maxRandom = stdin.readLineSync();

      if (maxRandom == null) {
        return;
      }

      var max = int.tryParse(maxRandom);

      if (max == null) {
        return;
      }

      game = Game(max);

      print('╔══════════════════════════════════════════════════');
      print('║              GUESS THE NUMBER                    ');
      print('║──────────────────────────────────────────────────');

      do {
        stdout.write('║  Guess the number between 1 and $max : ');

        var input = stdin.readLineSync();

        if (input == null) {
          return;
        }

        var guess = int.tryParse(input);

        if (guess == null) {
          continue;
        }

        guessResult = game.doGuess(guess);

        if (guessResult == GuessResult.correct) {
          print(
              '║  ☛ $guess ☯ is CORRECT! , total guesses: ${game.totalGuesses} ♚ ✅');
          print('║──────────────────────────────────────────────────');
          print('║                    THE END                       ');
          print('╚══════════════════════════════════════════════════');
        } else if (guessResult == GuessResult.tooHigh) {
          print('║  ☛ $guess is TOO HIGH! ▲');
          print('║──────────────────────────────────────────────────');
        } else {
          print('║  ☛ $guess is TOO LOW! ▼');
          print('║──────────────────────────────────────────────────');
        }
      } while (guessResult != GuessResult.correct);
    }
    stdout.write('Play again? (Y/N) : ');
    again = stdin.readLineSync();

    if (again == null) {
      continue;
    }
  } while (again != 'N' && again != 'n');

  List totalGuess = game.getSumGuess;
  print("You've play ${totalGuess.length} game");

  for (int i = 0; i < totalGuess.length; i++) {
    print(' Game #${i + 1}: ${totalGuess[i]} guesses');
  }
}