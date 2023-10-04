import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculation.dart';
import 'package:flutter_application_1/variables.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DiceGame',
      home: SafeArea(child: MyHomePage(title: 'Yahtzee')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: drawAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            drawDicesRow(),
            drawHoldButtonsRow(),
            drawRollButtonRow(),
            drawResultsPane(),
          ],
        ),
      ),
    );
  }

  Padding drawResultsPane() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            drawCategoryColumn(),
            drawValueColumn(),
            drawStoreButtonsColumn()
          ],
        ),
      );

  Column drawCategoryColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: drawAllCategoryTexts(),
      );

  Column drawValueColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: drawAllValueTexts(),
      );

  Column drawStoreButtonsColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: drawAllStoreButtons(),
      );

  List<Widget> drawAllCategoryTexts() => <Widget>[
        drawSingleNormalText('Ones'),
        drawSingleNormalText('Twos'),
        drawSingleNormalText('Threes'),
        drawSingleNormalText('Fours'),
        drawSingleNormalText('Fives'),
        drawSingleNormalText('Sixes'),
        drawSingleBoldText('TOTAL'),
        drawSingleNormalText('Min'),
        drawSingleNormalText('Sum'),
        drawSingleBoldText('TOTAL'),
        drawSingleNormalText('Straight'),
        drawSingleNormalText('Three of a kind'),
        drawSingleNormalText('Four of a kind'),
        drawSingleNormalText('Five of a kind'),
        drawSingleNormalText('Full house'),
        drawSingleNormalText('Chance'),
        drawSingleBoldText('TOTAL'),
        drawSingleBoldText('GRAND TOTAL'),
      ];

  List<Widget> drawAllValueTexts() => <Widget>[
        drawStoredOrPossibleValueForSingles(1),
        drawStoredOrPossibleValueForSingles(2),
        drawStoredOrPossibleValueForSingles(3),
        drawStoredOrPossibleValueForSingles(4),
        drawStoredOrPossibleValueForSingles(5),
        drawStoredOrPossibleValueForSingles(6),
        drawSingleBoldValue(Brain.calculateSumOfSingles()),
        drawStoredOrPossibleValueForMin(Brain.calculatePossibleTotal()),
        drawStoredOrPossibleValueForMax(Brain.calculatePossibleTotal()),
        drawSingleBoldValue(Brain.calculateSumOfMinMax()),
        drawStoredOrPossibleValueForStraight(Brain.calculatePossibleStraight()),
        drawStoredOrPossibleValueForThreeOfKind(
            Brain.calculatePossibleManyOfKind(3)),
        drawStoredOrPossibleValueForFourOfKind(
            Brain.calculatePossibleManyOfKind(4)),
        drawStoredOrPossibleValueForFiveOfKind(
            Brain.calculatePossibleManyOfKind(5)),
        drawStoredOrPossibleValueForFullHouse(
            Brain.calculatePossibleFullHouse()),
        drawStoredOrPossibleValueForChance(Brain.calculatePossibleTotal()),
        drawSingleBoldValue(Brain.calculateSumOfSpecials()),
        drawSingleBoldValue(Brain.calculateSumOfSums())
      ];

  List<Widget> drawAllStoreButtons() => <Widget>[
        singles[0] == NOT_ASSIGNED_VALUE ? drawStoreSinglesButton(1) : drawStoreDivider(),
        singles[1] == NOT_ASSIGNED_VALUE ? drawStoreSinglesButton(2) : drawStoreDivider(),
        singles[2] == NOT_ASSIGNED_VALUE ? drawStoreSinglesButton(3) : drawStoreDivider(),
        singles[3] == NOT_ASSIGNED_VALUE ? drawStoreSinglesButton(4) : drawStoreDivider(),
        singles[4] == NOT_ASSIGNED_VALUE ? drawStoreSinglesButton(5) : drawStoreDivider(),
        singles[5] == NOT_ASSIGNED_VALUE ? drawStoreSinglesButton(6) : drawStoreDivider(),
        drawStoreDivider(),
        min == NOT_ASSIGNED_VALUE ? drawStoreMinButton() : drawStoreDivider(),
        max == NOT_ASSIGNED_VALUE ? drawStoreMaxButton() : drawStoreDivider(),
        drawStoreDivider(),
        straight == NOT_ASSIGNED_VALUE ? drawStoreStraightButton() : drawStoreDivider(),
        three_of_a_kind == NOT_ASSIGNED_VALUE
            ? drawStoreThreeOfKindButton()
            : drawStoreDivider(),
        fourOfKind == NOT_ASSIGNED_VALUE
            ? drawStoreFourOfKindButton()
            : drawStoreDivider(),
        fiveOfKind == NOT_ASSIGNED_VALUE
            ? drawStoreFiveOfKindButton()
            : drawStoreDivider(),
        fullHouse == NOT_ASSIGNED_VALUE ? drawStoreFullHouseButton() : drawStoreDivider(),
        chance == NOT_ASSIGNED_VALUE ? drawStoreChanceButton() : drawStoreDivider(),
        drawStoreDivider(),
        drawStoreDivider()
      ];

  SizedBox drawStoreSinglesButton(int number) => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
            child: const Text("Submit", style: TextStyle(color: Colors.white)),
            onPressed: () {
              setState(() {
                singles[number - 1] = Brain.calculateSingles(number);
              });
            }),
      );

  SizedBox drawStoreMinButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              min = Brain.calculatePossibleTotal();
            });
          },
        ),
      );

  SizedBox drawStoreMaxButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              max = Brain.calculatePossibleTotal();
            });
          },
        ),
      );

  SizedBox drawStoreStraightButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              straight = Brain.calculatePossibleStraight();
            });
          },
        ),
      );

  SizedBox drawStoreThreeOfKindButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              three_of_a_kind = Brain.calculatePossibleManyOfKind(3);
            });
          },
        ),
      );

  SizedBox drawStoreFourOfKindButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              fourOfKind = Brain.calculatePossibleManyOfKind(4);
            });
          },
        ),
      );

  SizedBox drawStoreFiveOfKindButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              fiveOfKind = Brain.calculatePossibleManyOfKind(5);
            });
          },
        ),
      );

  SizedBox drawStoreFullHouseButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit",style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              fullHouse = Brain.calculatePossibleFullHouse();
            });
          },
        ),
      );

  SizedBox drawStoreChanceButton() => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: MaterialButton(
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
          onPressed: () {
            setState(() {
              chance = Brain.calculatePossibleTotal();
            });
          },
        ),
      );

  SizedBox drawStoreDivider() => SizedBox(height: HEIGHT_OF_THE_ROW);

  SizedBox drawStoredOrPossibleValueForSingles(int number) =>
      (singles[number - 1] >= 0)
          ? drawSingleNormalValue(singles[number - 1])
          : drawSinglePossibleValue(Brain.calculateSingles(number));

  SizedBox drawStoredOrPossibleValueForMin(int number) => min == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(min);

  SizedBox drawStoredOrPossibleValueForMax(int number) => max == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(max);

  SizedBox drawStoredOrPossibleValueForChance(int number) => chance == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(chance);

  drawStoredOrPossibleValueForFullHouse(int number) => fullHouse == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(fullHouse);

  drawStoredOrPossibleValueForStraight(int number) => straight == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(straight);

  drawStoredOrPossibleValueForThreeOfKind(int number) => three_of_a_kind == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(three_of_a_kind);

  drawStoredOrPossibleValueForFourOfKind(int number) => fourOfKind == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(fourOfKind);

  drawStoredOrPossibleValueForFiveOfKind(int number) => fiveOfKind == NOT_ASSIGNED_VALUE
      ? drawSinglePossibleValue(number)
      : drawSingleNormalValue(fiveOfKind);

  SizedBox drawSingleNormalValue(int value) =>
      drawSingleValue(value, false, true);

  SizedBox drawSingleBoldValue(int value) => drawSingleValue(value, true, true);

  SizedBox drawSinglePossibleValue(int value) =>
      drawSingleValue(value, false, false);

  SizedBox drawSingleValue(int value, bool bold, bool stored) => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: Text(
          value.toString(),
          style: TextStyle(
              fontSize: SIZE_IN_CATEGORY,
              color: stored ? Colors.blueAccent : Colors.white,
              backgroundColor: stored ? Colors.black : Colors.black,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        ),
      );

  SizedBox drawSingleNormalText(String text) => drawSingleText(text, false);
//   SizedBox drawSingleNormalText(String text) => SizedBox(
//   height: HEIGHT_OF_THE_ROW,
//   child: Text(
//     text,
//     style: const TextStyle(
//       fontSize: SIZE_IN_CATEGORY,
//       color: Colors.green, 
//       fontWeight: FontWeight.normal,
//     ),
//   ),
// );


  SizedBox drawSingleBoldText(String text) => drawSingleText(text, true);

  SizedBox drawSingleText(String text, bool bold) => SizedBox(
        height: HEIGHT_OF_THE_ROW,
        child: Text(
          text,
          style: TextStyle(
              fontSize: SIZE_IN_CATEGORY,
              color: Colors.white,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        ),
      );

  AppBar drawAppBar() => AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Colors.blueGrey.shade800,
      );

  Row drawRollButtonRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          drawRollButton(),
        ],
      );

  Row drawDicesRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          drawDice(0),
          drawDice(1),
          drawDice(2),
          drawDice(3),
          drawDice(4),
        ],
      );

  Row drawHoldButtonsRow() => Row(
        children: <Widget>[
          drawHoldButton(0),
          drawHoldButton(1),
          drawHoldButton(2),
          drawHoldButton(3),
          drawHoldButton(4),
        ],
      );

  void rollDices() => setState(() {
        for (int i = 0; i < DICE_NUMBER; i++) {
          if (!hold[i]) values[i] = Random().nextInt(6) + 1;
        }
      });

  void holdOrRollDice(int i) => setState(() {
        hold[i] = !hold[i];
      });

  Expanded drawDice(int num) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image(
            height: 50,
            image: AssetImage('images/dice${values[num]}.png'),
          ),
        ),
      );

  Expanded drawHoldButton(int num) => Expanded(
  child: Container( // Wrap with a Container
    margin: const EdgeInsets.all(3.0), // Adjust margin as needed
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: hold[num] ? Colors.white : Colors.blueAccent,
      ),
      onPressed: () => holdOrRollDice(num),
      child: Text(
        'Hold',
        style: TextStyle(
          color: hold[num] ? Colors.blueAccent : Colors.white,
        ),
      ),
    ),
  ),
);


  TextButton drawRollButton() => TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        ),
        onPressed: rollDices,
        child: const Text(
          'ROLL THE DICE',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
      );
}
