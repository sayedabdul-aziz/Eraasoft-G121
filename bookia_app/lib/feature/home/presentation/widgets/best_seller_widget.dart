import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/home/presentation/page/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerBooksWidget extends StatelessWidget {
  const BestSellerBooksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is BestSellerLoadedState || current is BestSellerLoadingState,
      builder: (context, state) {
        if (state is BestSellerLoadedState) {
          var books = context.read<HomeBloc>().bestSellerResponseModel?.data;
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: books?.products?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    push(context,
                        BookDetailsView(product: books?.products?[index]));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Hero(
                          tag: books?.products?[index].id ?? '',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: books?.products?[index].image ?? '',
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        )),
                        const Gap(8),
                        Text(
                          books?.products?[index].name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyTextStyle(context),
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Text(
                              '\$${books?.products?[index].price ?? ''}',
                              style: getBodyTextStyle(context),
                            ),
                            const Spacer(),
                            CustomButton(
                                height: 35,
                                width: 80,
                                color: AppColors.textColor,
                                text: 'Buy',
                                onTap: () {}),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
