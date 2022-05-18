part of 'comment_list_bloc.dart';

abstract class CommentListState extends Equatable {
  const CommentListState();
}

class CommentLoading extends CommentListState {
  @override
  List<Object> get props => [];
}

class CommentListSuccess extends CommentListState {
  final List<CommentEntity> comments;

  const CommentListSuccess(this.comments);

  @override
  List<Object?> get props => [comments];
}

class CommentListException extends CommentListState {
  final AppException appException;

  const CommentListException(this.appException);

  @override
  List<Object?> get props => [appException];
}
