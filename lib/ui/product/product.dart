import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikki_shop/common/constants.dart';
import 'package:nikki_shop/common/utils.dart';
import 'package:nikki_shop/data/models/product_entitiy.dart';
import 'package:nikki_shop/theme.dart';
import 'package:nikki_shop/ui/product/comments/comment_list.dart';
import 'package:nikki_shop/ui/widget/image_loading_service.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productEntity})
      : super(key: key);
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          physics: bouncingScrollPhysics,
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.width * 0.8,
              flexibleSpace: ImageLoadingService(
                url: productEntity.image!,
              ),
              foregroundColor: LightThemeColor.primaryTextColor,
              actions: [Icon(CupertinoIcons.heart)],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          productEntity.title!,
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              productEntity.previousPrice!.withPriceLabel,
                              style: Theme.of(context).textTheme.caption!.apply(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(productEntity.price!.withPriceLabel),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                        'این کتونی شدیدا برای دویدن و راه رفتن مناسب هست و تقریبا.'
                        ' هیچ فشار مخربی رو نمیذارد به پا و زانوان شما انتقال داده شود',style: TextStyle(height: 1.8),),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'نظرات کاربران',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .apply(color: LightThemeColor.secondaryTextColor),
                        ),
                        TextButton(onPressed: () {}, child: Text('ثبت نظر'))
                      ],
                    ),

                  ],
                ),
              ),
            ),
            CommentList(productId: productEntity.id!)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: FloatingActionButton.extended(
                onPressed: () {}, label: Text('افزودن به سبد خرید'))),
      ),
    );
  }
}
