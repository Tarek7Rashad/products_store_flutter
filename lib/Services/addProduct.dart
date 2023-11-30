import 'package:product_store/Models/getAllProductsModel.dart';
import 'package:product_store/helper/apiHelper.dart';
import 'package:product_store/shared/Components/constant.dart';

class AddProduct {
  Future<GetAllProductsModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> postResponse =
        // ignore: missing_required_param
        await ApiHelper().postApiHeader(url: '$baseUrl/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return GetAllProductsModel.fromJson(postResponse);
  }
}
