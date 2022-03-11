import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ruchan_adiguzel_mobx_weekend/core/base_model/base_view_model.dart';
import 'package:ruchan_adiguzel_mobx_weekend/post/view_model/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      viewModel: ProductViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ProductViewModel value) => Scaffold(
        appBar: AppBar(title: Text("mobx practice with fakeStore")),
        body: Observer(
          builder: (context) => value.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: value.productList.length,
                  itemBuilder: (context, i) {
                    final _tempModel = value.productList[i];
                    return Card(
                      child: ListTile(
                        title: Text(_tempModel.title ?? "null title"),
                        subtitle: Text(_tempModel.description ?? "null"),
                        leading: Image.network(_tempModel.image ?? ""),
                        trailing: Column(
                          children: [
                            Text("Rating:${_tempModel.rating?.rate}"),
                            Text("Count:${_tempModel.rating?.count}")
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
