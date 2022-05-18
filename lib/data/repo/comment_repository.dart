import 'package:nikki_shop/data/common/http_client.dart';
import 'package:nikki_shop/data/models/comment_entitiy.dart';
import 'package:nikki_shop/data/source/comment_data_source.dart';

abstract class ICommentRepository {
  Future<List<CommentEntity>> getAll({required int productId});
}

class CommentRepository implements ICommentRepository {
  final ICommentDataSource commentDataSource;

  CommentRepository(this.commentDataSource);

  @override
  Future<List<CommentEntity>> getAll({required int productId}) =>
      commentDataSource.getAll(productId: productId);
}

final commentRepository =
    CommentRepository(CommentRemoteDataSource(httpClient));
