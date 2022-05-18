import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikki_shop/data/models/comment_entitiy.dart';
import 'package:nikki_shop/data/repo/comment_repository.dart';
import 'package:nikki_shop/ui/product/comments/comment_list_bloc.dart';
import 'package:nikki_shop/ui/widget/app_error.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key, required this.productId}) : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      final CommentListBloc bloc = CommentListBloc(
          commentRepository: commentRepository, productId: productId);
      bloc.add(CommentListStarted());
      return bloc;
    }, child: BlocBuilder<CommentListBloc, CommentListState>(
        builder: (context, state) {
      if (state is CommentListSuccess) {
        return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return CommentItem(
            commentData: state.comments[index],
          );
        }, childCount: state.comments.length));
      } else if (state is CommentLoading) {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is CommentListException) {
        return SliverToBoxAdapter(
            child: AppError(
          onTap: () {
            BlocProvider.of<CommentListBloc>(context).add(CommentListStarted());
          },
          appException: state.appException,
        ));
      } else {
        throw Exception('state is Not Supported');
      }
    }));
  }
}

class CommentItem extends StatelessWidget {
  final CommentEntity commentData;

  const CommentItem({
    Key? key,
    required this.commentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
        border:Border.all(color: themeData.dividerColor,width: 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(commentData.title.toString().trim()),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(commentData.author!.email.toString(),style: themeData.textTheme.caption,),
                ],
              ),
              Text(commentData.date.toString(),style: themeData.textTheme.caption,),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(commentData.content.toString()),
        ],
      ),
    );
  }
}
