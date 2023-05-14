import 'package:flutter/material.dart';
import 'package:sosko/main.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/settings_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding:  EdgeInsets.only(left: DimensionScreen.getWidth(context, 24)),
            child: InkWell(
              onTap: ()=>navigatorKey.currentState.pushReplacement( MaterialPageRoute(builder: (_) => SettingsScreen() )),
                child: Image.asset('assets/images/Back.png')),
          ),
          title: Text(
            'Profile',
            style: KTextStyle.headline3.copyWith(fontSize: 20),
          ),
          actions: [
            Padding(
              padding:
                  EdgeInsets.only(right: DimensionScreen.getWidth(context, 24)),
              child: InkWell(
                  onTap: () =>navigatorKey.currentState.pushReplacement( MaterialPageRoute(builder: (_) => SettingsScreen() )),
                  child: Image.asset('assets/images/Save.png')),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: DimensionScreen.getWidth(context, 24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: DimensionScreen.geHeight(context, 38)),
                Text('Photo',
                    style: KTextStyle.body2
                        .copyWith(fontWeight: FontWeight.normal, fontSize: 16)),
                SizedBox(height: DimensionScreen.geHeight(context, 9)),
                Center(
                    child: Image.asset(
                  'assets/images/m.png',
                  height: DimensionScreen.geHeight(context, 80),
                  width: DimensionScreen.getWidth(context, 80),
                )),
                SizedBox(height: DimensionScreen.geHeight(context, 9)),
                Center(
                    child: Text('Upload Image',
                        style: KTextStyle.headline1.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600))),
                SizedBox(height: DimensionScreen.geHeight(context, 38)),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Name',
                        style: KTextStyle.body2.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: KColor.veryLightGray),
                            ),
                            hintText: 'Enter your name',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 34)),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Email',
                        style: KTextStyle.body2.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ),
                    //SizedBox(width: 100),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColor.veryLightGray),
                          ),
                          hintText: 'Enter your email',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 34)),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Phone',
                        style: KTextStyle.body2.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ),
                    //SizedBox(width: 100),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColor.veryLightGray),
                          ),
                          hintText: 'Enter your phone number',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 34)),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Address',
                        style: KTextStyle.body2.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ),
                    //SizedBox(width: 100),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: KColor.veryLightGray),
                          ),
                          hintText: 'Enter your address',
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
