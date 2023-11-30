import 'package:product_store/Models/getAllProductsModel.dart';
import 'package:product_store/helper/apiHelper.dart';
import 'package:product_store/shared/Components/constant.dart';

class GetOneGategory {
  Future<List<GetAllProductsModel>> getOneCategory(
      {required String categoryName}) async {
    List<dynamic> response = await ApiHelper()
        // ignore: missing_required_param
        .getApiHelper(url: '$baseUrl/products/category/$categoryName');
    List<GetAllProductsModel> oneCategoryList = [];
    for (var i = 0; i < response.length; i++) {
      oneCategoryList.add(GetAllProductsModel.fromJson(response[i]));
    }
    return oneCategoryList;
  }
}
