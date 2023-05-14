import 'package:flutter/material.dart';
import 'package:sosko/main.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/global_widgets/custom_button.dart';
import 'package:sosko/view/screen/home_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class VerificationScreen extends StatefulWidget {
  final String value;

  const VerificationScreen({Key key, this.value}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 130)),
              Text(
                'Verification',
                style: KTextStyle.headline3.copyWith(fontSize: 30),
              ),
              Text('Please Enter the code we sent to',
                  style:
                      KTextStyle.body2.copyWith(fontWeight: FontWeight.normal)),
              Text(
                widget.value,
                style: KTextStyle.caption.copyWith(fontSize: 14),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 40)),
              Container(
                height: DimensionScreen.geHeight(context, 65),
                decoration: BoxDecoration(
                    color: Color(0xffF6F7FB),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                    hintText: 'Enter Code',
                    hintStyle: KTextStyle.subtitle1
                        .copyWith(fontSize: 16, color: KColor.lightGray),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(
                      top: DimensionScreen.geHeight(context, 19)),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Don\'t receive yet?',
                        style: KTextStyle.subtitle2),
                    TextSpan(
                        text: ' Resend',
                        style: KTextStyle.headline1.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600))
                  ])),
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 299)),
              CustomButton(
                buttonText: 'Confirm',
                onPressed: () => navigatorKey.currentState.pushNamedAndRemoveUntil( '/bottomNavScreen',
                        (Route<dynamic> route) => false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
