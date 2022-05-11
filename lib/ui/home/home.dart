import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikki_shop/data/repo/banner_repository.dart';
import 'package:nikki_shop/data/repo/product_repository.dart';
import 'package:nikki_shop/generated/assets.dart';
import 'package:nikki_shop/ui/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      final homebloc = HomeBloc(
        productRepository: productRepository,
        bannerRepository: bannerRepository,
      );
      //homebloc.add();
      return homebloc;
    }, child: Scaffold(body: SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return ListView.builder(
                itemCount: 5,
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Image.asset(
                      Assets.imagesNikeLogo,
                      height: 32,
                    );
                  } else {
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
            return Center(
              child: Text(
                state.exception.message.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            );
          } else {
            throw Exception('state is not valid');
          }
        },
      ),
    )));
  }
}
