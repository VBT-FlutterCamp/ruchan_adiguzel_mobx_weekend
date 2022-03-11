import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ruchan_adiguzel_mobx_weekend/core/base_model/base_view_model.dart';
import 'package:ruchan_adiguzel_mobx_weekend/post/model/post_model.dart';
import 'package:ruchan_adiguzel_mobx_weekend/post/view_model/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);
  final title = "Mobx practice with fakeStore";

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
      viewModel: ProductViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ProductViewModel value) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Observer(
          builder: (context) => value.isLoading
              ? LoadBar()
              : ListView.builder(
                  itemCount: value.productList.length,
                  itemBuilder: (context, i) {
                    final _tempModel = value.productList[i];
                    return ProductCard(_tempModel);
                  },
                ),
        ),
      ),
    );
  }

  Center LoadBar() => Center(child: CircularProgressIndicator());

  Card ProductCard(ProductModel _tempModel) => Card(
        child: ListTile(
          title: Text(_tempModel.title ?? "null title"),
          subtitle: DescriptionText(tempModel: _tempModel),
          leading: ImageViewer(_tempModel),
          trailing: DetailProduct(_tempModel),
        ),
      );

  Image ImageViewer(ProductModel _tempModel) {
    return Image.network(_tempModel.image ?? "", height: 50, width: 50);
  }

  Column DetailProduct(ProductModel _tempModel) {
    return Column(
      children: [
        Text("Rating:${_tempModel.rating?.rate}"),
        Text("Count:${_tempModel.rating?.count}"),
        Text("Price:${_tempModel.price}\$")
      ],
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required ProductModel tempModel,
  })  : _tempModel = tempModel,
        super(key: key);

  final ProductModel _tempModel;

  @override
  Widget build(BuildContext context) {
    return Text(_tempModel.description ?? "null",
        maxLines: 3, style: TextStyle(overflow: TextOverflow.fade));
  }
}
