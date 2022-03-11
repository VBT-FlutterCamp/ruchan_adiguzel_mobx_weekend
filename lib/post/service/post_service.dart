import 'package:dio/dio.dart';

class PostService {
  static PostService? _instace;
  static PostService get instance {
    if (_instace == null) _instace = PostService._init();
    return _instace!;
  }

  late final Dio dio;
  final String _url = "https://fakestoreapi.com";

  PostService._init() {
    dio = Dio(BaseOptions(baseUrl: _url));
  }
}
