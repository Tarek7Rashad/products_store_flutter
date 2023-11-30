import 'package:product_store/Models/getAllProductsModel.dart';
import 'package:product_store/helper/apiHelper.dart';
import 'package:product_store/shared/Components/constant.dart';

class GetAllProductService {
  Future<List<GetAllProductsModel>> getAllProducts() async {
    List<dynamic> responseApi =
        // ignore: missing_required_param
        await ApiHelper().getApiHelper(url: '$baseUrl/products');

    List<GetAllProductsModel> productsList = [];
    for (var i = 0; i < responseApi.length; i++) {
      productsList.add(GetAllProductsModel.fromJson(responseApi[i]));
    }
    return productsList;
  }
}
