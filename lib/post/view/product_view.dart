import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ruchan_adiguzel_mobx_weekend/core/base_model/base_view_model.dart';
import 'package:ruchan_adiguzel_mobx_weekend/post/view_model/product_view_mode.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      viewModel: ProductViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ProductViewModel value) => Scaffold(
        appBar: AppBar(title: Text("mobx practice with fakeStore")),
        body: ListView.builder(
          itemBuilder: (context, index) => Card(
            child: ListTile(title: Text("title")),
          ),
        ),
      ),
    );
  }
}
