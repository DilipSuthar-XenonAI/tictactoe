import 'package:flutter/material.dart';
import '../widgets/custombtn.dart';
import 'package:provider/provider.dart';
import '../backend/script.dart';

class PlayerSelection extends StatefulWidget {
  @override
  _PlayerSelectionState createState() => _PlayerSelectionState();
}

class _PlayerSelectionState extends State<PlayerSelection> {
  var _groupvalue = 1;
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    final playerfirst = game.namefirst;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$playerfirst! Choose your side",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Opacity(
                  opacity: _groupvalue == 1 ? 1 : .5,
                  child: Image(
                    image: AssetImage("assets/images/playerX.png"),
                    width: 100,
                    height: 100,
                  ),
                ),
                Transform.scale(
                  scale: 1.5,
                  child: Radio(
                    value: 1,
                    groupValue: _groupvalue,
                    onChanged: (val) {
                      setState(() {
                        _groupvalue = val;
                      });
                    },
                    activeColor: Color(0xff6aaff5),
                  ),
                ),
              ]),
              Column(
                children: [
                  Opacity(
                    opacity: _groupvalue == 2 ? 1 : .5,
                    child: Image(
                      image: AssetImage("assets/images/playerO.png"),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: 2,
                      groupValue: _groupvalue,
                      onChanged: (val) {
                        setState(() {
                          _groupvalue = val;
                        });
                      },
                      activeColor: Color(0xff6aaff5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          CustomBtn(
            child: Text(
              "Continue",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            height: 40,
            width: 120,
            func: () {
              Navigator.pushNamed(context, "playground");
              game.firstplayer = _groupvalue;
              if (_groupvalue == 1) {
                game.secondplayer = 2;
              } else {
                game.secondplayer = 1;
              }
              print(game.firstplayer);
              print(game.secondplayer);
            },
          )
        ],
      ),
    ));
  }
}
