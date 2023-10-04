const DICE_NUMBER = 5;
const SIZE_IN_CATEGORY = 16.0;
const HEIGHT_OF_THE_ROW = 22.0;
const NOT_ASSIGNED_VALUE = -1;

// the values of the dices
List<int> values = [1, 1, 1, 1, 1];

// to properly hold the dices
List<bool> hold = [false, false, false, false, false];

// each and every other values stored
List<int> singles = [
  NOT_ASSIGNED_VALUE,
  NOT_ASSIGNED_VALUE,
  NOT_ASSIGNED_VALUE,
  NOT_ASSIGNED_VALUE,
  NOT_ASSIGNED_VALUE,
  NOT_ASSIGNED_VALUE
];
int min = NOT_ASSIGNED_VALUE;
int max = NOT_ASSIGNED_VALUE;
int straight = NOT_ASSIGNED_VALUE;
int fullHouse = NOT_ASSIGNED_VALUE;
int three_of_a_kind = NOT_ASSIGNED_VALUE;
int fourOfKind = NOT_ASSIGNED_VALUE;
int fiveOfKind = NOT_ASSIGNED_VALUE;
int chance = NOT_ASSIGNED_VALUE;
