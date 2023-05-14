import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sosko/main.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int secondaryIndex = 0;
  String selectedValue;
  bool isChecked = false;
  bool isSelected;

  List<int> _selectedItems = List<int>();
  List<String> imageList = [
    'assets/images/pmm.png',
    'assets/images/visa.png',
    'assets/images/paypal.png',
    'assets/images/g.png',
    'assets/images/apple.png',
  ];

  void changeIndex(int index) {
    setState(() {
      secondaryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: InkWell(
                /* onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/bottomNavScreen', ModalRoute.withName('/checkoutScreen')),*/
                child: Image.asset('assets/images/Back.png')),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Checkout',
                style: KTextStyle.headline3.copyWith(fontSize: 20),
              ),
              Text(
                '2 Items',
                style: KTextStyle.body2.copyWith(fontSize: 12),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: KColor.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: DimensionScreen.getWidth(context, 24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: DimensionScreen.geHeight(context, 37)),
                Text(
                  'Delivery Location',
                  style: KTextStyle.headline3.copyWith(fontSize: 16),
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 19)),
                Row(
                  children: [
                    Text(
                      'New York,street 12,Calofony road\nUSA',
                      style: KTextStyle.body2.copyWith(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Change',
                          style: KTextStyle.body2.copyWith(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 29)),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Shiping Option',
                    style: KTextStyle.headline3.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 19)),
                Row(
                  children: [
                    Image.asset('assets/images/fed.png',
                        height: DimensionScreen.geHeight(context, 40),
                        width: DimensionScreen.getWidth(context, 40)),
                    SizedBox(width: DimensionScreen.getWidth(context, 10)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shiping fee \$10.00',
                            style: KTextStyle.headline1.copyWith(
                                fontSize: 12, fontWeight: FontWeight.normal)),
                        Text('Will be receive on 19 April,2021',
                            style: KTextStyle.body2.copyWith(
                                fontSize: 12, fontWeight: FontWeight.normal))
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Change',
                          style: KTextStyle.body2.copyWith(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 29)),
                Text(
                  'Payment Option',
                  style: KTextStyle.headline3.copyWith(fontSize: 16),
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 19)),
                Container(
                  height: DimensionScreen.geHeight(context, 52),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: imageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          changeIndex(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: DimensionScreen.getWidth(context, 15)),
                          height: DimensionScreen.geHeight(context, 52),
                          width: DimensionScreen.getWidth(context, 66),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: secondaryIndex == index
                                    ? KColor.tertiary
                                    : Colors.transparent,
                              )),
                          child: Image.asset(
                            imageList[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 21)),
                Row(
                  children: [
                    Text('Use cash on Delivery',
                        style: KTextStyle.headline6.copyWith(fontSize: 16)),
                    Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: CustomSwitchButton(
                              backgroundColor: KColor.tertiary,
                              unCheckedColor: Color(0xffDDDDDD),
                              animationDuration: Duration(milliseconds: 400),
                              checkedColor: KColor.white,
                              checked: isChecked,
                            ),
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 21)),
                Divider(color: Color(0xffE9EBF4), thickness: 1),
                SizedBox(height: DimensionScreen.geHeight(context, 39)),
                Row(
                  children: [
                    Text('Total:',
                        style: KTextStyle.body2.copyWith(fontSize: 16)),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Text('\$80.00',
                                style: KTextStyle.headline3
                                    .copyWith(fontSize: 26))))
                  ],
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 154)),
                Center(
                  child: Container(
                      height: DimensionScreen.geHeight(context, 64),
                      width: DimensionScreen.getWidth(context, 263),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FlatButton(
                            onPressed: () {
                              navigatorKey.currentState.pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          BottomNavigationScreen()));
                            },
                            color: KColor.tertiary,
                            child: Text(
                              'Pay Now',
                              style: KTextStyle.headline1
                                  .copyWith(color: KColor.white, fontSize: 18),
                            )),
                      )),
                ),
                SizedBox(height: DimensionScreen.geHeight(context, 40)),
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
