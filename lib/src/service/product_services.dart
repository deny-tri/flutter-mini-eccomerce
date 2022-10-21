part of 'services.dart';

class ProductService {
  Future<BaseResponse> fetchProductList() async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}products"));
      if (response.statusCode == 200) {
        return BaseResponse(response.body, 'Success');
      } else {
        return BaseResponse(null, 'Failed');
      }
    } catch (e) {
      return BaseResponse(null, e.toString());
    }
  }

  Future<BaseResponse> fetchDetailProduct(int id) async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}products/$id"));
      if (response.statusCode == 200) {
        return BaseResponse(response.body, 'Success');
      } else {
        return BaseResponse(null, 'Failed');
      }
    } catch (e) {
      return BaseResponse(null, e.toString());
    }
  }

  Future<BaseResponse> fetchCategoryJewel() async {
    try {
      final response =
          await http.get(Uri.parse("${baseUrl}products/category/jewelery"));
      if (response.statusCode == 200) {
        return BaseResponse(response.body, 'Success');
      } else {
        return BaseResponse(null, 'Failed');
      }
    } catch (e) {
      return BaseResponse(null, e.toString());
    }
  }
}
