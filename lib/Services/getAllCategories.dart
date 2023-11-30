import 'package:product_store/helper/apiHelper.dart';
import 'package:product_store/shared/Components/constant.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllServices() async {
    List<dynamic> response =
        // ignore: missing_required_param
        await ApiHelper().getApiHelper(url: '$baseUrl/products/categories');
    return response;
  }
}
