import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:product_store/Models/getAllProductsModel.dart';
import 'package:product_store/Services/getAllProducts.dart';
import 'package:product_store/shared/Components/constant.dart';
import 'package:product_store/widgets/CustomStackCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "homePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: kBlueGreyColor,
                ))
          ],
          backgroundColor: kWhiteColor,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Products',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    )),
                Text(' Store',
                    style: TextStyle(
                      fontSize: 24,
                      color: kBlueGreyColor,
                    )),
              ],
            ),
          ),
        ),
        body: FutureBuilder<List<GetAllProductsModel>>(
          future: GetAllProductService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<GetAllProductsModel> products = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 60),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 70,
                      childAspectRatio: 1.4),
                  itemBuilder: (context, index) {
                    return CustomStackCard(
                      productsModel: products[index],
                    );
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
