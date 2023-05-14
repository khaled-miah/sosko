import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/screen/home_screen.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderTrackingScreen extends KFDrawerContent {
   OrderTrackingScreen({Key key}) ;

  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final CameraPosition _initPosition = CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.5);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: DimensionScreen.getWidth(context, 24)),
          child: InkWell(
              onTap: () => context.nextPage(BottomNavigationScreen()),
              child: Image.asset('assets/images/Back.png')),
        ),
        title: Text(
          'Order Tracking',
          style: KTextStyle.headline3.copyWith(fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: DimensionScreen.getWidth(context, 24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 47)),
              Container(
                height: DimensionScreen.geHeight(context, 36),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/mann.png',
                      height: DimensionScreen.geHeight(context, 36),
                      width: DimensionScreen.getWidth(context, 36),
                    ),
                    SizedBox(width: DimensionScreen.getWidth(context, 15)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Delivery Boy',
                            style: KTextStyle.body2.copyWith(
                                fontSize: 10, fontWeight: FontWeight.normal)),
                        Text('Fahim Ahmed', style: KTextStyle.subtitle2)
                      ],
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                launch("tel://21213123123");
                              },
                              child: Image.asset('assets/images/cal.png'))),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: DimensionScreen.getWidth(context, 17)),
                child: Image.asset(
                  'assets/images/st.png',
                  height: DimensionScreen.geHeight(context, 80),
                  width: DimensionScreen.getWidth(context, 2),
                ),
              ),
              Container(
                height: DimensionScreen.geHeight(context, 36),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/location.png',
                      height: DimensionScreen.geHeight(context, 36),
                      width: DimensionScreen.getWidth(context, 36),
                    ),
                    SizedBox(width: DimensionScreen.getWidth(context, 15)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address',
                            style: KTextStyle.body2.copyWith(
                                fontSize: 10, fontWeight: FontWeight.normal)),
                        Text('Housing Estate,Lan 9,25/3',
                            style: KTextStyle.subtitle2)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: DimensionScreen.getWidth(context, 17)),
                child: Image.asset(
                  'assets/images/st.png',
                  height: DimensionScreen.geHeight(context, 80),
                  width: DimensionScreen.getWidth(context, 2),
                ),
              ),
              Container(
                height: DimensionScreen.geHeight(context, 36),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/clock.png',
                      height: DimensionScreen.geHeight(context, 36),
                      width: DimensionScreen.getWidth(context, 36),
                    ),
                    SizedBox(width: DimensionScreen.getWidth(context, 15)),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivery Date',
                              style: KTextStyle.body2.copyWith(
                                  fontWeight: FontWeight.normal, fontSize: 10)),
                          Text('19 April-22 April', style: KTextStyle.subtitle2)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: DimensionScreen.getWidth(context, 17)),
                child: Image.asset(
                  'assets/images/st.png',
                  height: DimensionScreen.geHeight(context, 80),
                  width: DimensionScreen.getWidth(context, 2),
                ),
              ),
              Container(
                height: DimensionScreen.geHeight(context, 36),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/phn.png',
                      height: DimensionScreen.geHeight(context, 36),
                      width: DimensionScreen.getWidth(context, 36),
                    ),
                    SizedBox(width: DimensionScreen.getWidth(context, 15)),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID',
                              style: KTextStyle.body2.copyWith(
                                  fontSize: 10, fontWeight: FontWeight.normal)),
                          Text('159-107-1397', style: KTextStyle.subtitle2)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 40)),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: DimensionScreen.geHeight(context, 200),
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition: _initPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    mapType: MapType.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
