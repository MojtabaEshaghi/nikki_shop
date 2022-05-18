import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nikki_shop/common/exeption.dart';
import 'package:nikki_shop/data/models/comment_entitiy.dart';
import 'package:nikki_shop/data/repo/comment_repository.dart';

part 'comment_list_event.dart';

part 'comment_list_state.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  final ICommentRepository commentRepository;
  final int productId;

  CommentListBloc({required this.commentRepository, required this.productId})
      : super(CommentLoading()) {
    on<CommentListEvent>((event, emit) async {
      if (event is CommentListStarted) {
        emit(CommentLoading());
        try {
          final comments = await commentRepository.getAll(productId: productId);
          emit(CommentListSuccess(comments));
        } catch (e) {
          emit(CommentListException(AppException(message: e.toString())));
        }
      }
    });
  }
}
