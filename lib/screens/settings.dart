import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../backend/script.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    TextEditingController _firstplayer =
        TextEditingController(text: game.namefirst);
    TextEditingController _secondplayer =
        TextEditingController(text: game.namesecond);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "First Player",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  TextField(
                    controller: _firstplayer,
                    onChanged: (val) {
                      game.namefirst = val;
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Second Player",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  TextField(
                    controller: _secondplayer,
                    onChanged: (val) {
                      game.namesecond = val;
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
