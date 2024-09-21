import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/home/presentation/page/home/widgets/best_seller_widget.dart';
import 'package:bookia_app/feature/home/presentation/page/home/widgets/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBannerWidget(),
              const Gap(16),
              Text('Best Seller', style: getTitleTextStyle(context)),
              const Gap(16),
              const BestSellerBooksWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
