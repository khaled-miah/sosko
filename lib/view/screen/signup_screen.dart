import 'package:flutter/material.dart';
import 'package:sosko/view/global_widgets/custom_button.dart';
import 'package:sosko/view/global_widgets/custom_textfield.dart';
import 'package:sosko/view/screen/login_screen.dart';
import 'package:sosko/view/screen/verification_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController textController = TextEditingController();

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
              Text('Create your',
                  style: KTextStyle.headline3.copyWith(fontSize: 30)),
              SizedBox(height: 30),
              CustomTextField(
                icon: Icons.person,
                hintText: 'Enter your name',
              ),
              SizedBox(height: 25),
              CustomTextField(
                icon: Icons.email,
                hintText: 'Enter your email',
                controller: textController,
              ),
              SizedBox(height: 25),
              CustomTextField(
                icon: Icons.lock,
                hintText: 'Enter Password',
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 187)),
              CustomButton(
                buttonText: 'Sign Up',
                onPressed: () => context.nextReplacementPage(VerificationScreen(
                  value: textController.text,
                )),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: ()=>context.nextReplacementPage(LogInScreen()),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: DimensionScreen.geHeight(context, 19)),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Already have account? ',
                          style: KTextStyle.subtitle2),
                      TextSpan(
                          text: 'Please',
                          style: KTextStyle.subtitle2),
                      TextSpan(
                          text: ' Log In',
                          style: KTextStyle.headline1.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600))
                    ])),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
