import 'package:tictactoe/widgets/custombtn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {
  int round = 1;
  int scorefirst = 0;
  String namefirst = "Player1";
  int firstplayer;
  int secondplayer;
  String namesecond = "Player2";
  int scoresecond = 0;
  List<List<int>> keys = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];
  bool isgameend = false;
  bool isblank = true;
  int winner = 3;
  List<String> players = ["Match tie", "X wins", "O wins"];
  void checkBingo() {
    int i = 1;
    while (i < 3) {
      if (keys[0][0] == i && keys[0][1] == i && keys[0][2] == i ||
          keys[1][0] == i && keys[1][1] == i && keys[1][2] == i ||
          keys[2][0] == i && keys[2][1] == i && keys[2][2] == i ||
          keys[0][0] == i && keys[1][0] == i && keys[2][0] == i ||
          keys[0][1] == i && keys[1][1] == i && keys[2][1] == i ||
          keys[0][2] == i && keys[1][2] == i && keys[2][2] == i ||
          keys[0][0] == i && keys[1][1] == i && keys[2][2] == i ||
          keys[0][2] == i && keys[1][1] == i && keys[2][0] == i) {
        winner = i;
        isgameend = true;
        notifyListeners();
      }
      i++;
    }

    if (keys[0].indexOf(0) == -1 &&
        keys[1].indexOf(0) == -1 &&
        keys[2].indexOf(0) == -1) {
      isblank = false;
    }
    if (isblank == false && winner == 3) {
      winner = 0;
      print("hello");
      isgameend = true;
      notifyListeners();
    }
  }

  bool positionFiller(int x, int y, int val, context) {
    if (keys[x][y] == 0) {
      keys[x][y] = val;
      round = round == 1 ? 2 : 1;
      checkBingo();
      print(winner);
      if (isgameend) {
        showmydialog(context, players[winner]);
        if (winner == 1) {
          if (firstplayer == 1) {
            scorefirst++;
          } else if (secondplayer == 1) {
            scoresecond++;
          }
        } else if (winner == 2) {
          if (firstplayer == 2) {
            scorefirst++;
          } else if (secondplayer == 2) {
            scoresecond++;
          }
        }
        reset();
      }
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    if (winner != 0) {
      round = winner;
    } else {
      round = 1;
    }
    winner = 3;
    keys = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0],
    ];
    isgameend = false;
    isblank = true;
  }

  void completeReset() {
    round = 1;
    winner = 3;
    keys = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0],
    ];
    scorefirst = 0;
    scoresecond = 0;
    isblank = true;
    isgameend = false;
    notifyListeners();
  }
}

Future showmydialog(context, player) => showDialog(
    context: context,
    builder: (_) => AlertDialog(
          content: Text("$player"),
          elevation: 1.0,
          actions: [
            CustomBtn(
              width: 100,
              height: 40,
              child: Text("ok"),
              func: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
