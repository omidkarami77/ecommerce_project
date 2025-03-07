import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 177,

          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.red,
                  ),
                  height: 340,
                  width: 177,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Positioned(
            bottom: 0,

            child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                expansionFactor: 5,
                dotColor: Colors.white,
                activeDotColor: ColorProject.blueIndicator,
                dotHeight: 10,
                dotWidth: 10,
              ),
              controller: controller,
              count: 3,
            ),
          ),
        ),
      ],
    );
  }
}
