import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedBanner = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: SvgPicture.asset(
          AssetsIcons.logoSvg,
          height: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.notificationSvg),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.searchSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: 4,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/banner.png',
                                height: 150,
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
                onDotClicked: (index) {})
          ],
        ),
      ),
    );
  }
}
