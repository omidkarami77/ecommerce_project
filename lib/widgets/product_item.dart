import 'package:ecommerce_project/bloc/product/product_bloc.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/data/model/product.dart';
import 'package:ecommerce_project/screen/product_detail_screen.dart';
import 'package:ecommerce_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatefulWidget {
  ProductItems _productItems;
  ProductItem(this._productItems, {super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => BlocProvider(
                  create: (context) => ProductBloc(),
                  child: ProductDetailScreen(widget._productItems),
                ),
          ),
        );
      },

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 90,
                      child: CachedImage(
                        urlImage: widget._productItems.thumbnail,
                      ),
                    ),
                  ],
                ),

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
                    "${widget._productItems.name}",

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
                              "${widget._productItems.price}",
                              style: const TextStyle(
                                fontFamily: 'sm',
                                fontSize: 12,
                                color: Colors.white,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              "${widget._productItems.discountPrice}",
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
      ),
    );
  }
}
