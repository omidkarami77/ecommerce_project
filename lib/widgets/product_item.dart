import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/iphone.png")],
              ),

              Positioned(
                right: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset("assets/images/active_fav_product.png"),
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10),
                child: Text(
                  "آیفون 13 پرو مکس",
                  maxLines: 1,
                  style: TextStyle(fontFamily: 'sm', fontSize: 14),
                ),
              ),
              Container(
                height: 53,
                decoration: const BoxDecoration(
                  color: ColorProject.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorProject.blue,
                      blurRadius: 25,
                      spreadRadius: -12,
                      offset: Offset(0.0, 15),
                    ),
                  ],
                ),
                child: Padding(
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
                      const Spacer(),
                      SizedBox(
                        width: 24,
                        child: Image.asset(
                          'assets/images/icon_right_arrow_cricle.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
