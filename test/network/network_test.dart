import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:ruchan_adiguzel_mobx_weekend/post/service/post_service.dart';

void main(List<String> args) {
  setUp(() {});
  test('Sample Test', () async {
    final response = await PostService.instance.dio.get("/products");
    inspect(response.data);

    expect(response.data, isNotNull);
  });
}
