import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sosko/view/global_widgets/auth_page.dart';
import 'package:sosko/view/global_widgets/class_builder.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';

class DrawerScreen extends StatefulWidget {
  final String title;

  const DrawerScreen({Key key, this.title}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('BottomNavigationScreen'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Discover',
              style: KTextStyle.caption
                  .copyWith(fontSize: 22, color: KColor.veryLightGray)),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Shop',
            style: KTextStyle.caption
                .copyWith(fontSize: 22, color: KColor.veryLightGray),
          ),
        ),
        KFDrawerItem.initWithPage(
          text: Text('History',
              style: KTextStyle.caption
                  .copyWith(fontSize: 22, color: KColor.veryLightGray)),
          page: ClassBuilder.fromString('HistoryScreen'),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Inbox',
              style: KTextStyle.caption
                  .copyWith(fontSize: 22, color: KColor.veryLightGray)),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Order Tracking',
              style: KTextStyle.caption
                  .copyWith(fontSize: 22, color: KColor.veryLightGray)),
          page: ClassBuilder.fromString('OrderTrackingScreen'),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Ask an Expert',
              style: KTextStyle.caption
                  .copyWith(fontSize: 22, color: KColor.white)),
          page: ClassBuilder.fromString('FAQScreen'),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Settings',
              style: KTextStyle.caption
                  .copyWith(fontSize: 22, color: KColor.veryLightGray)),
          page: ClassBuilder.fromString('SettingsScreen'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: KFDrawer(
      controller: _drawerController,
      header: KFDrawerItem(
        text: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset(
                  'assets/images/spactacle.png',
                  alignment: Alignment.centerLeft,
                  height: DimensionScreen.geHeight(context, 55),
                  width: DimensionScreen.getWidth(context, 50),
                ),
              ),
            ),
            Positioned(
                top: 8,
                left: 70,
                child: Text('Yasin Rahib',
                    style: KTextStyle.body2
                        .copyWith(
                        color: KColor.white, fontSize: 18))),
            Positioned(
                top: 30,
                left: 70,
                child: Text(
                  'hellobesnik@gmail.com',
                  style:
                  KTextStyle.caption.copyWith(color: KColor.white),
                )),
           /* Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Yasin Rahib',
                      style: KTextStyle.body2
                          .copyWith(
                          color: KColor.white, fontSize: 18)),
                  Text(
                    'hellobesnik@gmail.com',
                    style:
                    KTextStyle.caption.copyWith(color: KColor.white),
                  )
                ],
              ),
            )*/

          ],
        )
      ),
      footer: KFDrawerItem(
        text: Column(
          children: [
            Image.asset('assets/images/ar.png',
                height: DimensionScreen.geHeight(context, 43),
                width: DimensionScreen.getWidth(context, 70.48)),
            SizedBox(
              height: DimensionScreen.geHeight(context, 14),
            ),
            Text('Log Out',
                style: KTextStyle.caption
                    .copyWith(fontSize: 22, color: KColor.white)),
          ],
        ),
        /*icon: Icon(
          Icons.input,
          color: Colors.white,
        ),*/
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return AuthPage();
            },
          ));
        },
      ),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('pinki ',
              style: KTextStyle.caption
                  .copyWith(fontSize: 22, color: KColor.white)),
          //icon: Icon(Icons.home, color: Colors.white),
          //page: ClassBuilder.fromString('BottomNavigationScreen'),
        ),
      ],
      decoration: BoxDecoration(color: KColor.tertiary
          /*gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(255, 255, 255, 1.0),
            Color.fromRGBO(44, 72, 171, 1.0)
          ],
          tileMode: TileMode.repeated,
        ),*/
          ),
    ));
  }
}
