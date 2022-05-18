import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikki_shop/common/constants.dart';
import 'package:nikki_shop/data/models/product_entitiy.dart';
import 'package:nikki_shop/data/repo/banner_repository.dart';
import 'package:nikki_shop/data/repo/product_repository.dart';
import 'package:nikki_shop/generated/assets.dart';
import 'package:nikki_shop/ui/home/bloc/home_bloc.dart';
import 'package:nikki_shop/ui/widget/app_error.dart';
import 'package:nikki_shop/ui/widget/banner_slider.dart';
import 'package:nikki_shop/ui/widget/product_iItems.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      final homebloc = HomeBloc(
        productRepository: productRepository,
        bannerRepository: bannerRepository,
      );
      homebloc.add(HomeStarted());
      return homebloc;
    }, child: Scaffold(body: SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Container(
                        height: 56,
                        alignment: Alignment.center,
                        child: Image.asset(
                          Assets.imagesNikeLogo,
                          height: 24,
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    case 2:
                      return BannerSlider(
                        banners: state.banner,
                      );

                    case 3:
                      return HorizontalProductList(
                        title: 'جدیدترین',
                        onTap: () {},
                        products: state.latestProduct,
                      );
                    case 4:
                      return HorizontalProductList(
                        title: 'پربازدیدترین ',
                        onTap: () {},
                        products: state.latestProduct,
                      );
                    default:
                      return Container(
                        color: Colors.grey,
                      );
                  }
                });
          } else if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeError) {
            return AppError(
                appException: state.exception,
                onTap: () {
                  BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
                });
          } else {
            throw Exception('state is not valid');
          }
        },
      ),
    )));
  }
}

class HorizontalProductList extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final List<ProductEntity> products;

  const HorizontalProductList({
    Key? key,
    required this.title,
    required this.onTap,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme!.subtitle1,
              ),
              TextButton(onPressed: onTap, child: Text('مشاهده همه'))
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
              itemCount: products.length,
              physics: bouncingScrollPhysics,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItems(
                  product: product,
                  borderRadius: BorderRadius.circular(12),
                );
              }),
        )
      ],
    );
  }
}
