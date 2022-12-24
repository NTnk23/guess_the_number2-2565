import 'dart:io';
import 'dart:math';

void main() {

  var r = Random();
  var answer = r.nextInt(100) + 1;
//print('Guess the number betweem 1 and 100(inclusive):');

  var isCorrect = false;
  do {
    stdout.write('Guess the number betweem 1 and 100:');
    var input = stdin.readLineSync();

    if (input == null) {
      print('Error,input is NULL');
      return;
    }
    var guess = int.tryParse(input);

    if (guess == null) {
      continue;

    }
    isCorrect = doGuess(guess, answer);
  } while (!isCorrect);
}
var sum = 0;
bool doGuess(int guess,int answer){

  if (guess == answer) {
    sum++;
    print('$guess ☯ is CORRECT!,total guesses: $sum ♚ ✅');
    return true;

  }
  else if (guess > answer) {

    print('$guess ↬ is TOO HIGH ⤊');
    sum++;
    return false;

  }
  else{

    print('$guess ↬ is TOO LOW ⤋');
    sum++;
    return false;

 }

}


