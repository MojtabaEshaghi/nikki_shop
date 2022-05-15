import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikki_shop/common/constants.dart';
import 'package:nikki_shop/data/models/banner_entity.dart';
import 'package:nikki_shop/ui/widget/image_loading_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);
  final List<BannerEntity> banners;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: banners.length,
              physics: bouncingScrollPhysics,
              itemBuilder: (context, index) => _Slide(banner: banners[index])),
          Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  count: banners.length,
                  controller: _pageController,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                    spacing: 4.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 3.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey.shade400,
                    activeDotColor: Colors.grey.shade700,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final BannerEntity banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ImageLoadingService(
        url: banner.image!,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
