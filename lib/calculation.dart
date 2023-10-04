import 'package:flutter_application_1/variables.dart';

class Brain {
  // This function calculates the sum of the dice values that match a specified number.
// It takes an integer 'number' as input, representing the number to match.
// It returns an integer representing the sum of dice values that match 'number'.

  static int calculateSingles(int number) {
    int total =
        0; // Initialize a variable 'total' to store the sum of matching dice values.

    // Iterate through each dice (from 0 to DICE_NUMBER - 1).
    for (int j = 0; j < DICE_NUMBER; j++) {
      // Check if the value of the current dice (values[j]) is equal to the specified 'number'.
      if (values[j] == number) {
        // If the condition is true, add the value of the current dice to 'total'.
        total += values[j];
      }
    }

    // After iterating through all dice, return the calculated 'total' value.
    return total;
  }

  // This function calculates the sum of all dice values.
// It iterates through each dice and accumulates their values into 'total'.
// It returns an integer representing the total sum of dice values.

  static int calculatePossibleTotal() {
    int total =
        0; // Initialize a variable 'total' to store the sum of all dice values.

    // Iterate through each dice (from 0 to DICE_NUMBER - 1).
    for (int j = 0; j < DICE_NUMBER; j++) {
      // Add the value of the current dice to 'total'.
      total += values[j];
    }

    // After iterating through all dice, return the calculated 'total' value.
    return total;
  }

  static int calculatePossibleStraight() {
    // Check if there is exactly one of each number from 2 to 5 (inclusive)
    // and either a 1 or a 6 using the 'countDicesForNumber' function.
    bool hasValidStraight = (countDicesForNumber(2) == 1 &&
            countDicesForNumber(3) == 1 &&
            countDicesForNumber(4) == 1 &&
            countDicesForNumber(5) == 1) &&
        (countDicesForNumber(1) == 1 || countDicesForNumber(6) == 1);

    // If a valid straight is found, return a score of 50; otherwise, return 0.
    return hasValidStraight ? 50 : 0;
  }

  static int calculatePossibleFullHouse() {
    // Create a list to store the values of the five dice.
    List<int> dices = [0, 0, 0, 0, 0];

    // Copy the values of the dice into the list.
    for (int j = 0; j < 5; j++) {
      dices[j] = values[j];
    }

    // Sort the dice values in ascending order.
    dices.sort();

    // Check if either of the two full house conditions is met:
    // 1. First three dice are the same, and last two dice are the same.
    // 2. First two dice are the same, and last three dice are the same.
    if (((dices[0] == dices[1] && dices[1] == dices[2]) &&
            (dices[3] == dices[4])) ||
        ((dices[0] == dices[1]) &&
            (dices[2] == dices[3] && dices[3] == dices[4]))) {
      // If a full house is found, return the sum of all dice values.
      return dices[0] + dices[1] + dices[2] + dices[3] + dices[4];
    }

    // If no full house is found, return 0.
    return 0;
  }

  static int calculatePossibleManyOfKind(int howMany) {
    // Loop through possible values from 1 to 6.
    for (int j = 1; j <= 6; j++) {
      // Calculate the possible score for the current value (j) and number of dice (howMany).
      var sum = calculatePossibleManyOfKindForNumber(howMany, j);

      // If a valid score is obtained (greater than 0), return it.
      if (sum > 0) {
        return sum;
      }
    }

    // If no valid combination is found, return 0.
    return 0;
  }

  static int calculatePossibleManyOfKindForNumber(int howMany, int number) {
    // Check if there are at least 'howMany' dice with the specified 'number'.
    if (countDicesForNumber(number) >= howMany) {
      // If the condition is met, return the score, which is the product of 'howMany' and 'number'.
      return howMany * number;
    } else {
      // If the condition is not met, return 0.
      return 0;
    }
  }

  static int countDicesForNumber(int number) {
    // Initialize a counter to keep track of the number of dice with the specified 'number'.
    int count = 0;

    // Iterate through all the dice values.
    for (int j = 0; j < DICE_NUMBER; j++) {
      // Check if the current dice value is equal to the specified 'number'.
      if (values[j] == number) {
        // If it matches, increment the count.
        count++;
      }
    }

    // Return the count, representing the number of dice with the desired value.
    return count;
  }

  static int calculateSumOfSingles() {
    int sum = 0;
    for (int j = 0; j < 6; j++) {
      if (singles[j] >= 0) sum += singles[j];
    }
    return sum;
  }

  static int calculateSumOfMinMax() {
    return (max >= 0 && min >= 0 && singles[0] >= 0)
        ? (max - min) * singles[0]
        : 0;
  }

  static int calculateSumOfSpecials() {
    // Initialize a variable 'sum' to store the sum of special scores.
    int sum = 0;

    // Check if the 'straight' score is calculated (non-negative), and if so, add it to the sum.
    if (straight >= 0) {
      sum += straight;
    }

    // Check if the 'fullHouse' score is calculated (non-negative), and if so, add it to the sum.
    if (fullHouse >= 0) {
      sum += fullHouse;
    }

    // Check if the 'three_of_a_kind' score is calculated (non-negative), and if so, add it to the sum.
    if (three_of_a_kind >= 0) {
      sum += three_of_a_kind;
    }

    // Check if the 'fourOfKind' score is calculated (non-negative), and if so, add it to the sum.
    if (fourOfKind >= 0) {
      sum += fourOfKind;
    }

    // Check if the 'fiveOfKind' score is calculated (non-negative), and if so, add it to the sum.
    if (fiveOfKind >= 0) {
      sum += fiveOfKind;
    }

    // Check if the 'chance' score is calculated (non-negative), and if so, add it to the sum.
    if (chance >= 0) {
      sum += chance;
    }

    // Return the total 'sum' of special scores.
    return sum;
  }

  static int calculateSumOfSums() {
    return calculateSumOfSingles() +
        calculateSumOfMinMax() +
        calculateSumOfSingles();
  }
}
