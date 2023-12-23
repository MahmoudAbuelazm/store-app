import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static const String id = 'update_product_screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, imageUrl;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                    inputType: TextInputType.name,
                    hint: 'Product Name',
                    onChanged: (
                      value,
                    ) {
                      productName = value;
                    },
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      inputType: TextInputType.name,
                      hint: 'Description',
                      onChanged: (
                        value,
                      ) {
                        desc = value;
                      }),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      inputType: TextInputType.number,
                      hint: 'Price',
                      onChanged: (
                        value,
                      ) {
                        price = value;
                      }),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      inputType: TextInputType.url,
                      hint: 'Image URL',
                      onChanged: (
                        value,
                      ) {
                        imageUrl = value;
                      }),
                  SizedBox(
                    height: height * .1,
                  ),
                  CustomElevatedButton(
                    text: 'Update Product',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await UpdateProduct().updateProduct(
                          id: product.id,
                          title: productName == null
                              ? product.title
                              : productName!,
                          price:
                              price == null ? product.price.toString() : price!,
                          description:
                              desc == null ? product.description : desc!,
                          image: imageUrl == null ? product.image : imageUrl!,
                          category: product.category,
                        );
                        print('done');
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
