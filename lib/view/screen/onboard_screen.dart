import 'package:flutter/material.dart';
import 'package:sosko/view/global_widgets/custom_button.dart';
import 'package:sosko/view/screen/login_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

import '../style/dimension_screen.dart';

class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 100)),
              Text(
                'SOSKO',
                style: KTextStyle.headline1.copyWith(fontSize: 20),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: DimensionScreen.geHeight(context, 10)),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Welcome to',
                        style: KTextStyle.body2.copyWith(fontSize: 16)),
                    TextSpan(
                        text: ' SOSKO',
                        style: KTextStyle.headline1.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: '! Lets shop together',
                        style: KTextStyle.body2.copyWith(fontSize: 16))
                  ]),
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 83)),
              Image.asset('assets/images/onboard.png'),
              SizedBox(height: DimensionScreen.geHeight(context, 138)),
              CustomButton(
                buttonText: 'Let\'s Start',
                onPressed: () => context.nextPage(LogInScreen()),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 69)),
            ],
          ),
        ),
      ),
    );
  }
}
