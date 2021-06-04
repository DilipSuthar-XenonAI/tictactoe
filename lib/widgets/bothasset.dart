import 'package:flutter/material.dart';

class BothAssets extends StatefulWidget {
  @override
  _BothAssetsState createState() => _BothAssetsState();
}

class _BothAssetsState extends State<BothAssets> {
  @override
  void initState() {
    super.initState();
    ImageCache().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("assets/images/playerX.png"),
          width: 100,
          height: 100,
        ),
        Image(
            image: AssetImage("assets/images/playerO.png"),
            width: 100,
            height: 100)
      ],
    );
  }
}
