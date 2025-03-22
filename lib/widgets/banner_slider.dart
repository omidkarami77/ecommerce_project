import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/data/model/banner.dart';
import 'package:ecommerce_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  List<BannerItems>? list;

  BannerSlider({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 177,

          child: PageView.builder(
            controller: controller,
            itemCount: list?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  height: 340,
                  width: 177,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.red,
                    ),
                    child: CachedImage(
                      urlImage: list?[index].thumbnail ?? 'test',
                      radius: 15,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,

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
      ],
    );
  }
}
