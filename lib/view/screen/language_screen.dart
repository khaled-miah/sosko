import 'package:flutter/material.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/settings_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
              onTap: () => context.nextReplacementPage(SettingsScreen()),
              child: Image.asset(
                'assets/images/Back.png',
                height: DimensionScreen.geHeight(context, 36),
                width: DimensionScreen.getWidth(context, 36),
              ),
            ),
          ),
          title: Text(
            'Language',
            style: KTextStyle.headline3.copyWith(fontSize: 20),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: Column(
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 47)),
              Row(
                children: [
                  Text(
                    'English',
                    style: KTextStyle.headline6.copyWith(fontSize: 16),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff00CC96)),
                            activeColor: Color(0xff00CC96),
                            onChanged: (val) {
                              setSelectedRadio(val);
                            })),
                  )
                ],
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 20)),
              Row(
                children: [
                  Text(
                    'Arbic',
                    style: KTextStyle.headline6.copyWith(fontSize: 16),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                            value: 2,
                            groupValue: selectedRadio,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff00CC96)),
                            activeColor: Color(0xff00CC96),
                            onChanged: (val) {
                              setSelectedRadio(val);
                            })),
                  )
                ],
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 20)),
              Row(
                children: [
                  Text(
                    'Bangla',
                    style: KTextStyle.headline6.copyWith(fontSize: 16),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                            value: 3,
                            groupValue: selectedRadio,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff00CC96)),
                            activeColor: Color(0xff00CC96),
                            onChanged: (val) {
                              setSelectedRadio(val);
                            })),
                  )
                ],
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 20)),
              Row(
                children: [
                  Text(
                    'Japaness',
                    style: KTextStyle.headline6.copyWith(fontSize: 16),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                            value: 4,
                            groupValue: selectedRadio,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff00CC96)),
                            activeColor: Color(0xff00CC96),
                            onChanged: (val) {
                              setSelectedRadio(val);
                            })),
                  )
                ],
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 20)),
              Row(
                children: [
                  Text(
                    'Urdu',
                    style: KTextStyle.headline6.copyWith(fontSize: 16),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                            value: 5,
                            groupValue: selectedRadio,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff00CC96)),
                            activeColor: Color(0xff00CC96),
                            onChanged: (val) {
                              setSelectedRadio(val);
                            })),
                  )
                ],
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 20)),
              Row(
                children: [
                  Text(
                    'France',
                    style: KTextStyle.headline6.copyWith(fontSize: 16),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Radio(
                            value: 6,
                            groupValue: selectedRadio,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => KColor.tertiary),
                            activeColor: KColor.tertiary,
                            onChanged: (val) {
                              setSelectedRadio(val);
                            })),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
