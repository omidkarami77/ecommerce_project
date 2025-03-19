import 'dart:ui';

import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProject.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 44,
                  right: 44,
                  bottom: 32,
                  top: 20,
                ),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Image.asset("assets/images/icon_apple_blue.png"),
                      ),
                      Text(
                        "آیفون",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 16,
                          color: ColorProject.blue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Image.asset("assets/images/icon_back.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "se آیفون 22 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "SB", fontSize: 16),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Container(
                  height: 284,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 15,
                            right: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/icon_star.png"),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height: double.infinity,
                                child: Image.asset("assets/images/iphone.png"),
                              ),
                              Spacer(),
                              Image.asset(
                                "assets/images/icon_favorite_deactive.png",
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 44),
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: ColorProject.grey,
                                    ),
                                  ),
                                  width: 70,
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      "assets/images/iphone.png",
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "انتخاب رنگ",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SM",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10),

                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),

                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "انتخاب حافظه داخلی",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SM",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 26,
                          width: 74,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorProject.grey,
                              width: 0.5,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "512",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, fontFamily: "SM"),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10),

                          height: 26,
                          width: 74,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorProject.grey,
                              width: 0.5,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "256",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: "SM", fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),

                          height: 26,
                          width: 74,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorProject.grey,
                              width: 0.5,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "128",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: "SM", fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                    child: Container(
                      width: 340,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: ColorProject.grey, width: 1),
                      ),

                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Image.asset("assets/images/icon_left_categroy.png"),
                          SizedBox(width: 10),
                          Text(
                            "مشاهده",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SB",
                              color: ColorProject.blue,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              ": مشخصات فنی",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "SM",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: Container(
                      width: 340,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: ColorProject.grey, width: 1),
                      ),

                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Image.asset("assets/images/icon_left_categroy.png"),
                          SizedBox(width: 10),
                          Text(
                            "مشاهده",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SB",
                              color: ColorProject.blue,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              ": توضیحات محصول",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "SM",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 44, right: 44, top: 20),
                    child: Container(
                      width: 340,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: ColorProject.grey, width: 1),
                      ),

                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Image.asset("assets/images/icon_left_categroy.png"),
                          SizedBox(width: 10),
                          Text(
                            "مشاهده",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "SB",
                              color: ColorProject.blue,
                            ),
                          ),
                          Spacer(),

                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 30,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 45,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 60,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    color: ColorProject.grey,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "+10",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "SB",
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10, left: 5),
                            child: Text(
                              ": نظرات کاربران",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "SM",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PriceButton(),
                  SizedBox(width: 20),
                  AddToBasketButton(),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 60,
            width: 140,
            decoration: BoxDecoration(
              color: ColorProject.blue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 53,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      "افزودن سبد خرید",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "SB",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceButton extends StatelessWidget {
  const PriceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 60,
            width: 140,
            decoration: BoxDecoration(
              color: ColorProject.green,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 53,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'تومان',
                              style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "11,480,000",
                                  style: const TextStyle(
                                    fontFamily: 'sm',
                                    fontSize: 12,
                                    color: Colors.white,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  "11,400,000",
                                  style: const TextStyle(
                                    fontFamily: 'sm',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
