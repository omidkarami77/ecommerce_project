import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String? urlImage;
  double radius;
  CachedImage({super.key, required this.urlImage, this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => Container(color: Colors.red[500]),
        placeholder: (context, url) {
          return Container(color: Colors.grey);
        },
        imageUrl: urlImage!,
        fit: BoxFit.cover,
      ),
    );
  }
}
