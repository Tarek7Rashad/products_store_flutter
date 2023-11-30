import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:product_store/Models/getAllProductsModel.dart';
import 'package:product_store/pages/updatePage.dart';
import 'package:product_store/shared/Components/constant.dart';

class CustomStackCard extends StatelessWidget {
  const CustomStackCard({
    super.key,
    required this.productsModel,
  });
  final GetAllProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: productsModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: kGreyColor.withOpacity(.1),
                  spreadRadius: 5,
                  offset: const Offset(10, 10))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productsModel.title.substring(0, 7),
                      style: TextStyle(fontSize: 17, color: kGreyColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${productsModel.price} \$",
                          style: TextStyle(fontSize: 17, color: kBlackColor),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.solidHeart,
                              color: kHeartColor,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: -45,
              right: 50,
              child: Image.network(
                productsModel.image,
                width: 100,
                height: 100,
              )
              //  ??
              // Image.asset(
              //   'assets/images/610OiiTm9PL._AC_SL1500_-removebg-preview.png',
              //   width: 100,
              //   height: 100,
              // ),
              ),
        ],
      ),
    );
  }
}
