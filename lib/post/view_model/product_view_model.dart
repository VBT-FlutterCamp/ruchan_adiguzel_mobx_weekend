import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:ruchan_adiguzel_mobx_weekend/post/model/post_model.dart';
import 'package:ruchan_adiguzel_mobx_weekend/post/service/post_service.dart';

import '../../core/base_model/base_view.dart';
part 'product_view_model.g.dart';

class ProductViewModel = _ProductViewModelBase with _$ProductViewModel;

abstract class _ProductViewModelBase with Store, BaseViewModel {
  @observable
  List<ProductModel> productList = [];
  @observable
  bool isLoading = false;
  @action
  Future<void> getProductList() async {
    _changeLoading();
    final response = await PostService.instance.dio.get("/products");
    if (response.statusCode == 200) {
      var _temp = response.data;
      productList =
          (_temp as List).map((e) => ProductModel.fromJson(e)).toList();
      _changeLoading();
    } else {
      _changeLoading();

      throw Exception("error ");
    }
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void setContext(BuildContext context) {}
  @override
  void init() {
    getProductList();
  }
}
