import 'package:flutter/material.dart';
import '../widgets/bothasset.dart';
import '../widgets/custombtn.dart';

class PlayerModeScreen extends StatefulWidget {
  @override
  _PlayerModeScreenState createState() => _PlayerModeScreenState();
}

class _PlayerModeScreenState extends State<PlayerModeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BothAssets(),
          SizedBox(
            height: 100,
          ),
          Text(
            "Choose your play mode",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 50,
          ),
          CustomBtn(
              width: 180,
              height: 40,
              child:
                  Text("With AI", style: Theme.of(context).textTheme.bodyText2),
              func: () {
                Navigator.pushNamed(context, 'construction');
              }),
          SizedBox(height: 20),
          CustomBtn(
            width: 180,
            height: 40,
            child: Text("With a friend",
                style: Theme.of(context).textTheme.bodyText2),
            func: () {
              Navigator.pushNamed(context, 'playerselection');
            },
          ),
          SizedBox(
            height: 100,
          ),
          CustomBtn(
            height: 50,
            width: 50,
            child: Icon(Icons.settings),
            func: () {
              Navigator.pushNamed(context, "settings");
            },
            iscircle: true,
          ),
        ],
      ),
    ));
  }
}
