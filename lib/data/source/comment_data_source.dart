import 'package:dio/dio.dart';
import 'package:nikki_shop/data/common/response_http.dart';
import 'package:nikki_shop/data/models/comment_entitiy.dart';

abstract class ICommentDataSource {
  Future<List<CommentEntity>> getAll({required int productId});
}

class CommentRemoteDataSource
    with HttpResponseValidator
    implements ICommentDataSource {
  final Dio httpClient;

  CommentRemoteDataSource(this.httpClient);

  @override
  Future<List<CommentEntity>> getAll({required int productId}) async {
    final response =
        await httpClient.get('/comment/list?product_id=$productId');
    validateResponse(response);
    final List<CommentEntity> commentList = [];
    for (var element in (response.data as List)) {
      commentList.add(CommentEntity.fromJson(element));
    }
    return commentList;
  }
}
