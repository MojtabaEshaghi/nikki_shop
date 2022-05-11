import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nikki_shop/common/exeption.dart';
import 'package:nikki_shop/data/models/banner_entity.dart';
import 'package:nikki_shop/data/models/product_entitiy.dart';
import 'package:nikki_shop/data/repo/banner_repository.dart';
import 'package:nikki_shop/data/repo/product_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository bannerRepository;
  final IProductRepository productRepository;

  HomeBloc({required this.bannerRepository, required this.productRepository})
      : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeLoading) {
        emit(HomeLoading());
        try {
          final banner = await bannerRepository.getAll();
          final latestProducts =
              await productRepository.getAll(ProductSort.latest);
          final popularProduct =
              await productRepository.getAll(ProductSort.popular);
          emit(HomeSuccess(
              banner: banner,
              latestProduct: latestProducts,
              popularProduct: popularProduct));
        } catch (e) {
          emit(HomeError(
              exception: e is AppException
                  ? e
                  : AppException(message: "خطای نامعلوم")));
        }
      }
    });
  }
}
