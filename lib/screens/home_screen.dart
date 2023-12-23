import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';

import '../widgets/custom_product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
        title: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductService().getAllProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100),
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          product: products[index],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
