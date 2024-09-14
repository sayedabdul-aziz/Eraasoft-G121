import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBannerWidget extends StatefulWidget {
  const HomeBannerWidget({super.key});

  @override
  State<HomeBannerWidget> createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  int selectedBanner = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeBannerLoadedState || current is HomeBannerLoadingState,
      builder: (context, state) {
        if (state is HomeBannerLoadedState) {
          var banner = context.read<HomeBloc>().homeBannerResponseModel?.data;
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: banner?.sliders?.length ?? 0,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: banner?.sliders?[itemIndex].image ?? '',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 1,
                    initialPage: 0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (value, reason) {
                      setState(() {
                        selectedBanner = value;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
              const Gap(16),
              SmoothPageIndicator(
                  controller: PageController(initialPage: selectedBanner),
                  count: 4,
                  effect: const ExpandingDotsEffect(
                      dotHeight: 7,
                      expansionFactor: 7,
                      radius: 7,
                      dotWidth: 7,
                      dotColor: AppColors.borderColor,
                      activeDotColor:
                          AppColors.primaryColor), // your preferred effect
                  onDotClicked: (index) {}),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
