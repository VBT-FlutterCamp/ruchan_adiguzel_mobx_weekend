// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductViewModel on _ProductViewModelBase, Store {
  final _$productListAtom = Atom(name: '_ProductViewModelBase.productList');

  @override
  List<ProductModel> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(List<ProductModel> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProductViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getProductListAsyncAction =
      AsyncAction('_ProductViewModelBase.getProductList');

  @override
  Future<void> getProductList() {
    return _$getProductListAsyncAction.run(() => super.getProductList());
  }

  final _$_ProductViewModelBaseActionController =
      ActionController(name: '_ProductViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_ProductViewModelBaseActionController.startAction(
        name: '_ProductViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productList: ${productList},
isLoading: ${isLoading}
    ''';
  }
}
