import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProject.backgroundScreenColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 44, right: 44, top: 20),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              "assets/images/icon_apple_blue.png",
                            ),
                          ),

                          Expanded(
                            child: Center(
                              child: Text(
                                "سبد خرید",
                                style: TextStyle(
                                  color: ColorProject.blue,
                                  fontFamily: "SB",
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CardItem();
                  }),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 44, left: 44, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              height: 53,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorProject.green,
                ),
                onPressed: () {},
                child: Text(
                  "ادامه فرایند خرید",
                  style: TextStyle(
                    fontFamily: "SB",
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
      height: 249,
      width: MediaQuery.of(context).size.width,

      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "1 ",
                          style: TextStyle(fontFamily: "SB", fontSize: 16),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "گارانتی 18 ماه مدیا پردازش",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: "SM",
                            color: ColorProject.grey,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
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
                            SizedBox(width: 5),

                            Text(
                              "تومان",
                              style: TextStyle(fontFamily: "SM", fontSize: 10),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "46,000,000",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: "SM",
                                color: ColorProject.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          children: [
                            OptionCheap(),
                            OptionCheap(),
                            OptionCheap(),
                            OptionCheap(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset("assets/images/iphone.png"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: DottedLine(
              lineThickness: 3,
              dashLength: 8.0,
              dashColor: ColorProject.grey.withOpacity(0.5),
              dashGapLength: 3.0,
              dashGapColor: Colors.transparent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45,350,000 تومان",
                style: TextStyle(fontFamily: "SM", fontSize: 16),
              ),
            ],
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  const OptionCheap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorProject.grey, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/icon_options.png"),
            SizedBox(width: 10),
            Text("111111"),
          ],
        ),
      ),
    );
  }
}
