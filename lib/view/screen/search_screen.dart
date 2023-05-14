import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sosko/model/filter_model.dart';
import 'package:sosko/view/global_widgets/bottom_navigation_screen.dart';
import 'package:sosko/view/global_widgets/custom_button.dart';
import 'package:sosko/view/style/dimension_screen.dart';
import 'package:sosko/view/style/k_color.dart';
import 'package:sosko/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex;
  List<int> _selectedItems = List<int>();
  List<int> _selectedItems2 = List<int>();

  final List<FilterModel> filterList = [
    FilterModel(
      title: 'All',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Lifestyle',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Sports',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Clothing',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Technology',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Health & Beauty',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
  ];
  final List<FilterModel> filterList2 = [
    FilterModel(
      title: 'Technology',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
    FilterModel(
      title: 'Health & Beauty',
      backgroundColor: KColor.white,
      textColor: KColor.secondary,
    ),
  ];
  List<String> imageList = [
    'assets/images/rr.png',
    'assets/images/ball.png',
    'assets/images/glass.png',
    'assets/images/sg.png',
  ];
  List<String> notes = [
    'Red Full Shirt',
    'Red Cricket Ball',
    'Red Cristal  Glass',
    'yed Sunglass',
  ];

  List<String> searchHero(String key) {
    return notes
        .where((hero) => hero.toLowerCase().startsWith(key.toLowerCase()))
        .toList();
  }

  List<String> result = [
    'Red Full Shirt',
    'Red Cricket Ball',
    'Red Cristal  Glass',
    'yed Sunglass',
  ];

  @override
  initState() {
    result = notes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: DimensionScreen.geHeight(context, 24)),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: DimensionScreen.geHeight(context, 40)),
              Row(
                children: [
                  Container(
                      height: DimensionScreen.geHeight(context, 40),
                      width: DimensionScreen.getWidth(context, 277),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: KColor.lightGrayishBlue),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 22.0,
                            color: KColor.lightGray,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25)),
                          contentPadding: EdgeInsets.symmetric(vertical: 7.0),
                        ),
                        onChanged: (key) {
                          setState(() {
                            if (key.isNotEmpty) {
                              notes = searchHero(key);
                            } else {
                              return result;
                              //result = notes;
                            }
                          });
                        },
                      )),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                    return Container(
                                      height: DimensionScreen.geHeight(
                                          context, 497),
                                      decoration: BoxDecoration(
                                          color: KColor.lightGrayishBlue,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0))),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      DimensionScreen.getWidth(
                                                          context, 24)),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 29)),
                                                  Row(
                                                    children: [
                                                      Text('Filter',
                                                          style: KTextStyle
                                                              .headline3
                                                              .copyWith(
                                                                  fontSize:
                                                                      20)),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Image.asset(
                                                            'assets/images/cross.png',
                                                            height:
                                                                DimensionScreen
                                                                    .geHeight(
                                                                        context,
                                                                        16),
                                                            width:
                                                                DimensionScreen
                                                                    .getWidth(
                                                                        context,
                                                                        16),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 19)),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: Wrap(
                                                      runSpacing: 20,
                                                      spacing: 10,
                                                      direction:
                                                          Axis.horizontal,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            if (_selectedItems
                                                                .contains(0)) {
                                                              setState(() {
                                                                _selectedItems
                                                                    .removeWhere(
                                                                        (val) =>
                                                                            val ==
                                                                            0);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _selectedItems
                                                                    .add(0);
                                                              });
                                                            }
                                                            print(
                                                                'test.......');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 26,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                color: (_selectedItems
                                                                        .contains(
                                                                            0))
                                                                    ? KColor
                                                                        .tertiary
                                                                    : filterList[
                                                                            0]
                                                                        .backgroundColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8),
                                                              child: Text(
                                                                  filterList[0]
                                                                      .title,
                                                                  style: KTextStyle.body2.copyWith(
                                                                      color: (_selectedItems.contains(
                                                                              0))
                                                                          ? KColor
                                                                              .white
                                                                          : filterList[0]
                                                                              .textColor)),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (_selectedItems
                                                                .contains(1)) {
                                                              setState(() {
                                                                _selectedItems
                                                                    .removeWhere(
                                                                        (val) =>
                                                                            val ==
                                                                            1);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _selectedItems
                                                                    .add(1);
                                                              });
                                                            }
                                                            print(
                                                                'test.......');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 26,
                                                            width: 87,
                                                            decoration: BoxDecoration(
                                                                color: (_selectedItems
                                                                        .contains(
                                                                            1))
                                                                    ? KColor
                                                                        .tertiary
                                                                    : filterList[
                                                                            1]
                                                                        .backgroundColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8),
                                                              child: Text(
                                                                  filterList[1]
                                                                      .title,
                                                                  style: KTextStyle.body2.copyWith(
                                                                      color: (_selectedItems.contains(
                                                                              1))
                                                                          ? KColor
                                                                              .white
                                                                          : filterList[1]
                                                                              .textColor)),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (_selectedItems
                                                                .contains(2)) {
                                                              setState(() {
                                                                _selectedItems
                                                                    .removeWhere(
                                                                        (val) =>
                                                                            val ==
                                                                            2);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _selectedItems
                                                                    .add(2);
                                                              });
                                                            }
                                                            print(
                                                                'test.......');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 26,
                                                            width: 76,
                                                            decoration: BoxDecoration(
                                                                color: (_selectedItems
                                                                        .contains(
                                                                            2))
                                                                    ? KColor
                                                                        .tertiary
                                                                    : filterList[
                                                                            2]
                                                                        .backgroundColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8),
                                                              child: Text(
                                                                  filterList[2]
                                                                      .title,
                                                                  style: KTextStyle.body2.copyWith(
                                                                      color: (_selectedItems.contains(
                                                                              2))
                                                                          ? KColor
                                                                              .white
                                                                          : filterList[2]
                                                                              .textColor)),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (_selectedItems
                                                                .contains(3)) {
                                                              setState(() {
                                                                _selectedItems
                                                                    .removeWhere(
                                                                        (val) =>
                                                                            val ==
                                                                            3);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _selectedItems
                                                                    .add(3);
                                                              });
                                                            }
                                                            print(
                                                                'test.......');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 26,
                                                            width: 87,
                                                            decoration: BoxDecoration(
                                                                color: (_selectedItems
                                                                        .contains(
                                                                            3))
                                                                    ? KColor
                                                                        .tertiary
                                                                    : filterList[
                                                                            3]
                                                                        .backgroundColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8),
                                                              child: Text(
                                                                  filterList[3]
                                                                      .title,
                                                                  style: KTextStyle.body2.copyWith(
                                                                      color: (_selectedItems.contains(
                                                                              3))
                                                                          ? KColor
                                                                              .white
                                                                          : filterList[3]
                                                                              .textColor)),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (_selectedItems
                                                                .contains(7)) {
                                                              setState(() {
                                                                _selectedItems
                                                                    .removeWhere(
                                                                        (val) =>
                                                                            val ==
                                                                            4);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _selectedItems
                                                                    .add(4);
                                                              });
                                                            }
                                                            print(
                                                                'test.......');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 26,
                                                            width: 107,
                                                            decoration: BoxDecoration(
                                                                color: (_selectedItems
                                                                        .contains(
                                                                            4))
                                                                    ? KColor
                                                                        .tertiary
                                                                    : filterList[
                                                                            4]
                                                                        .backgroundColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8),
                                                              child: Text(
                                                                  filterList[4]
                                                                      .title,
                                                                  style: KTextStyle.body2.copyWith(
                                                                      color: (_selectedItems.contains(
                                                                              4))
                                                                          ? KColor
                                                                              .white
                                                                          : filterList[4]
                                                                              .textColor)),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (_selectedItems
                                                                .contains(5)) {
                                                              setState(() {
                                                                _selectedItems
                                                                    .removeWhere(
                                                                        (val) =>
                                                                            val ==
                                                                            5);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                _selectedItems
                                                                    .add(5);
                                                              });
                                                            }
                                                            print(
                                                                'test.......');
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 26,
                                                            width: 140,
                                                            decoration: BoxDecoration(
                                                                color: (_selectedItems
                                                                        .contains(
                                                                            5))
                                                                    ? KColor
                                                                        .tertiary
                                                                    : filterList[
                                                                            5]
                                                                        .backgroundColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8),
                                                              child: Text(
                                                                  filterList[5]
                                                                      .title,
                                                                  style: KTextStyle.body2.copyWith(
                                                                      color: (_selectedItems.contains(
                                                                              5))
                                                                          ? KColor
                                                                              .white
                                                                          : filterList[5]
                                                                              .textColor)),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 39)),
                                                  Text(
                                                    'Price Range',
                                                    style: KTextStyle.headline3
                                                        .copyWith(fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 14)),
                                                  Center(
                                                    child: Image.asset(
                                                        'assets/images/pp.png',
                                                        height: DimensionScreen
                                                            .geHeight(context,
                                                                72.75)),
                                                  ),
                                                  SizedBox(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 40.3)),
                                                  CustomButton(
                                                      buttonText: 'Apply',
                                                      onPressed: () {
                                                        context.nextReplacementPage(BottomNavigationScreen());
                                                      }),
                                                  SizedBox(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 20.5)),
                                                  Container(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 56),
                                                      width:
                                                          context.screenWidth,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          border: Border.all(
                                                              color: KColor
                                                                  .tertiary)),
                                                      child: FlatButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: KTextStyle
                                                                .headline1
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontSize:
                                                                        18),
                                                          ))),
                                                  SizedBox(
                                                      height: DimensionScreen
                                                          .geHeight(
                                                              context, 29.5)),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        },
                        child: Image.asset(
                          'assets/images/Filter.png',
                          height: DimensionScreen.geHeight(context, 40),
                          width: DimensionScreen.getWidth(context, 40),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: DimensionScreen.geHeight(context, 10)),
              Container(
                height: DimensionScreen.geHeight(context, 230),
                width: DimensionScreen.getWidth(context, 277),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: KColor.lightGrayishBlue),
                child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          imageList[index],
                          height: 30,
                          width: 30,
                        ),
                        title: Align(
                            alignment: Alignment(-1.0, 0),
                            child: Text(
                              notes[index],
                              style: KTextStyle.caption,
                            )),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
