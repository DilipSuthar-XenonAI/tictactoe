import 'package:flutter/material.dart';
import '../backend/script.dart';
import 'package:provider/provider.dart';

class PlayGround extends StatefulWidget {
  @override
  _PlayGroundState createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  List<Widget> box = [
    Container(),
    Image(
      image: AssetImage("assets/images/playerX.png"),
      width: 70,
      height: 70,
    ),
    Image(
      image: AssetImage("assets/images/playerO.png"),
      width: 70,
      height: 70,
    )
  ];
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    var turn = "";
    if (game.round == 1) {
      if (game.firstplayer == 1) {
        turn = game.namefirst;
      } else if (game.secondplayer == 1) {
        turn = game.namesecond;
      }
    } else if (game.round == 2) {
      if (game.firstplayer == 2) {
        turn = game.namefirst;
      } else if (game.secondplayer == 2) {
        turn = game.namesecond;
      }
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          panel(context, game.namefirst, game.namesecond, game.scorefirst,
              game.scoresecond),
          Container(
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xffdde2e6),
                blurRadius: 7.0,
                offset: Offset(0.0, 7.0),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      boxboard(game, 0, 0, context),
                      boxboard(game, 0, 1, context),
                      boxboard(game, 0, 2, context),
                    ],
                  ),
                  Row(
                    children: [
                      boxboard(game, 1, 0, context),
                      boxboard(game, 1, 1, context),
                      boxboard(game, 1, 2, context),
                    ],
                  ),
                  Row(
                    children: [
                      boxboard(game, 2, 0, context),
                      boxboard(game, 2, 1, context),
                      boxboard(game, 2, 2, context),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffdde2e6),
                  blurRadius: 7.0,
                  offset: Offset(0.0, 7.0),
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(child: Text(turn + "'s turn")),
          ),
          IconButton(
              icon: Icon(Icons.restore_from_trash_outlined),
              onPressed: () {
                game.completeReset();
              }),
        ],
      ),
    );
  }

  GestureDetector boxboard(game, x, y, context) {
    return GestureDetector(
      onTap: () {
        game.positionFiller(x, y, game.round, context);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(x == 2 ? 0 : 1),
                ),
                right: BorderSide(
                  color: Colors.black.withOpacity(y == 2 ? 0 : 1),
                ))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: box[game.keys[x][y]],
        ),
      ),
    );
  }

  Padding panel(BuildContext context, String _firstplayer, String _secondplayer,
      int scorefirst, int scoresecond) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: width * 1 / 3,
            child: Center(
              child: Text(
                _firstplayer,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffdde2e6),
                    blurRadius: 7.0,
                    offset: Offset(0.0, 7.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Center(child: Text("$scorefirst - $scoresecond")),
          ),
          Container(
            width: width * 1 / 3,
            child: Center(
              child: Text(
                _secondplayer,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
