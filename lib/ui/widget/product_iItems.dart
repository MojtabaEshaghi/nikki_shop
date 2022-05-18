import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikki_shop/common/utils.dart';
import 'package:nikki_shop/data/models/product_entitiy.dart';
import 'package:nikki_shop/ui/product/product.dart';
import 'package:nikki_shop/ui/widget/image_loading_service.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    Key? key,
    required this.product,
    this.borderRadius,
  }) : super(key: key);

  final ProductEntity product;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ProductDetailsScreen(
                  productEntity: product,
                ))),
        child: SizedBox(
          width: 176,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 176,
                    height: 189,
                    child: ImageLoadingService(
                      url: product.image!,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          CupertinoIcons.heart,
                          size: 20,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  product.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.previousPrice!.withPriceLabel,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(product.price!.withPriceLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
