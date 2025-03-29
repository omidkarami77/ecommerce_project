import 'package:ecommerce_project/data/model/category.dart';
import 'package:ecommerce_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class CategoryItemChip extends StatelessWidget {
  final Items item;

  CategoryItemChip(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${item.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: ShapeDecoration(
                color: Color(hexColor),
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
            SizedBox(
              height: 24,
              width: 24,
              child: CachedImage(urlImage: item.icon),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          '${item.title}',
          style: TextStyle(fontFamily: "SB", color: Colors.black),
        ),
      ],
    );
  }
}
