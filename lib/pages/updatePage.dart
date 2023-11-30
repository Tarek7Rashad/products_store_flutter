import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_store/Models/getAllProductsModel.dart';
import 'package:product_store/Services/updateProduct.dart';
import 'package:product_store/shared/Components/constant.dart';
import 'package:product_store/widgets/CustomButton.dart';
import 'package:product_store/widgets/CustomTextFormField.dart';

// ignore: must_be_immutable
class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'updatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? name, description, price, image;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    GetAllProductsModel productsModel =
        ModalRoute.of(context)!.settings.arguments as GetAllProductsModel;

    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Update',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  )),
              Text(' Products',
                  style: TextStyle(
                    fontSize: 24,
                    color: kBlueGreyColor,
                  )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              CustomTextFormFieldWidget(
                onChanged: (value) {
                  name = value;
                },
                hintText: 'Name',
                labelText: "Name",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFieldWidget(
                onChanged: (value) {
                  description = value;
                },
                hintText: 'Description',
                labelText: "Description",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFieldWidget(
                input: TextInputType.number,
                onChanged: (value) {
                  price = value;
                },
                hintText: 'Price',
                labelText: "Price",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFieldWidget(
                onChanged: (value) {
                  image = value;
                },
                hintText: 'Image',
                labelText: "Image",
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                onPressed: () async {
                  loading = true;
                  setState(() {});
                  await updateProduct(productsModel);
                  try {
                    log('Succesfull');
                  } catch (e) {
                    log(e.toString());
                  }
                  loading = false;
                  setState(() {});
                },
                text: "Update",
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(GetAllProductsModel productsModel) async {
    await UpdateProduct().updateProduct(
        id: productsModel.id,
        title: name == null ? productsModel.title : name!,
        price: price == null ? productsModel.price.toString() : price!,
        description:
            description == null ? productsModel.description : description!,
        image: image == null ? productsModel.image : image!,
        category: productsModel.category);
  }
}
