import 'package:flutter/material.dart';

class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({super.key});

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
