import 'package:flutter/material.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const CustomButton({
    Key key,
    @required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: DimensionScreen.geHeight(context, 56),
        width: context.screenWidth,
        // ignore: deprecated_member_use
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FlatButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.bold),
            ),
            color: Color(0xff00CC96),
          ),
        ));
  }
}
