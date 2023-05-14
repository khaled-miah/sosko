import 'package:flutter/material.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/global_widgets/custom_button.dart';
import 'package:sosko/view/global_widgets/custom_textfield.dart';
import 'package:sosko/view/screen/signup_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 130)),
              Text(
                'Welcome to',
                style: KTextStyle.headline3.copyWith(fontSize: 30),
              ),
              Text(
                'SOSKO',
                style: KTextStyle.headline1.copyWith(fontSize: 30),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 35)),
              CustomTextField(icon: Icons.email, hintText: 'Enter Email'),
              SizedBox(height: DimensionScreen.geHeight(context, 25)),
              CustomTextField(
                icon: Icons.lock,
                hintText: 'Enter Password',
                isPasswordField: true,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    margin: EdgeInsets.only(
                        top: DimensionScreen.geHeight(context, 9)),
                    child: Text(
                      'forgot password',
                      style: KTextStyle.headline1.copyWith(
                          fontSize: 13, fontWeight: FontWeight.normal),
                    )),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 238)),
              CustomButton(
                buttonText: 'Log In',
                onPressed: () => context.nextReplacementPage(BottomNavigationScreen()),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: DimensionScreen.geHeight(context, 19)),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Don\'t have an account? ',
                          style: KTextStyle.subtitle2),
                      TextSpan(
                          text: 'Sign Up',
                          style: KTextStyle.headline1.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ])),
                  ),
                  onTap: () =>context.nextReplacementPage(SignUpScreen()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
