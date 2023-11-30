import 'package:product_store/Models/getAllProductsModel.dart';
import 'package:product_store/helper/apiHelper.dart';
import 'package:product_store/shared/Components/constant.dart';

class UpdateProduct {
  Future<GetAllProductsModel> updateProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required int id,
      required String category}) async {
    print(id);
    Map<String, dynamic> postResponse =
        // ignore: missing_required_param
        await ApiHelper().putApiHeader(url: '$baseUrl/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return GetAllProductsModel.fromJson(postResponse);
  }
}
