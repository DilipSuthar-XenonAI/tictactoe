import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;
  final bool iscircle;
  final func;

  const CustomBtn(
      {Key key, this.height, this.width, this.child, this.func, this.iscircle})
      : super(key: key);

  @override
  _CustomBtnState createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    // return TextButton(
    //   onPressed: widget.func,
    //   child: widget.child,
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(Color(0xfffbfdfc)),
    //     elevation: MaterialStateProperty.all(2.0),
    //   ),
    // );
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(.8),
          boxShadow: [
            BoxShadow(
                color: Color(0xccd6df).withOpacity(.4),
                offset: Offset(0.0, 5.0),
                blurRadius: 5.0)
          ],
        ),
        width: widget.width,
        height: widget.height,
        child: Center(child: widget.child),
      ),
      onTap: widget.func,
    );
  }
}
