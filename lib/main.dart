import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/widgets/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorProject.backgroundScreenColor,
        body: SafeArea(
          child: Center(
            child: Container(
              height: 216,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,

                children: [
                  SizedBox(height: 10),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Expanded(child: Container()),
                      Image.asset("assets/images/iphone.png"),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/images/active_fav_product.png",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            width: 26,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.red,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                "3%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "SB",
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, right: 10),
                        child: Text(
                          "آیفون 13 پرومکس",
                          style: TextStyle(fontFamily: "SM", fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: ColorProject.blue,
                      boxShadow: [
                        BoxShadow(
                          color: ColorProject.blue,
                          blurRadius: 25,
                          spreadRadius: -12,
                          offset: Offset(0.0, 15),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "تومان",
                            style: TextStyle(
                              fontFamily: "SM",
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 10),
                              child: Text(
                                "11,480,000",

                                style: TextStyle(
                                  decoration:
                                      TextDecoration.lineThrough, // خط روی متن
                                  decorationColor: Colors.white, // رنگ خط
                                  decorationThickness: 3, // ضخامت خط

                                  fontFamily: "SM",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 1),
                              child: Text(
                                "11,140,000",

                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left: 12, right: 10),

                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              "assets/images/icon_right_arrow_cricle.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryHorizontalItemList extends StatelessWidget {
  const CategoryHorizontalItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: ShapeDecoration(
                color: Colors.red,
                shadows: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 40,
                    spreadRadius: -9,
                    offset: Offset(0.0, 5),
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            Icon(color: Colors.white, Icons.mouse, size: 26),
          ],
        ),
        SizedBox(height: 10),
        Text("همه", style: TextStyle(fontFamily: "SB", color: Colors.black)),
      ],
    );
  }
}
