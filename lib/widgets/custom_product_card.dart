import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../screens/update_product_screen.dart';

class CustomProductCard extends StatelessWidget {
  ProductModel product;
  CustomProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10),
              )
            ]),
            child: Card(
              color: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 2,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$' + product.price.toString(),
                              style: TextStyle(),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -35,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
