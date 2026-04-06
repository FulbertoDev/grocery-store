import 'package:flutter/material.dart';
import 'package:grocery_store/app/app.locator.dart';
import 'package:grocery_store/app/app.router.dart';
import 'package:grocery_store/gen/assets.gen.dart';
import 'package:grocery_store/ui/common/app_colors.dart';
import 'package:grocery_store/ui/common/ui_helpers.dart';
import 'package:grocery_store/ui/widgets/ui/buttons/raised_button.dart';
import 'package:grocery_store/ui/widgets/ui/inputs/custom_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/data/models/product/product.dart';
import '../../widgets/navigation/app_drawer.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Assets.img.logo.image(
          height: kToolbarHeight,
          color: Colors.white,
        ),
      ),
      drawer: const AppDrawer(),
      body: Column(
        spacing: baseline_2x,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Hello chegue!\nWhat are you looking for ?".text.medium.black.make(),
          const CustomInput(
            icon: Icon(Icons.search_rounded),
            hintText: "Search",
            suffixIcon: Icon(
              Icons.tune_rounded,
              color: kcPrimaryColor,
            ),
          ),
          Row(
            spacing: baseline_2x_5,
            children: [
              Assets.img.fruits.image(),
              Column(
                spacing: baseline,
                children: [
                  "Exclusive Offer\nGet 30% Off On fruit"
                      .text
                      .base
                      .semiBold
                      .center
                      .white
                      .make(),
                  AppRaisedButton.primary(
                    backgroundColor: Vx.hexToColor("#F55959"),
                    label: "Order Now",
                    onPressed: () {},
                  ).h(baseline_5x)
                ],
              ).expand(),
            ],
          ).box.p12.rounded.hexColor("#86C649").make().aspectRatio(3),
          "Featured products".text.lg.semiBold.black.make(),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: baseline_2x,
            crossAxisSpacing: baseline_2x,
            childAspectRatio: .75,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: viewModel.products.map((product) {
              final isFav = viewModel.favorites
                  .map((e) => e.name == product.name)
                  .contains(true);
              return _ProductCard(product: product, isFavorite: isFav);
            }).toList(),
          ),
        ],
      ).scrollVertical().p16(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  const _ProductCard({
    required this.product,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Vx.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: kcPrimaryColor,
              ),
            ],
          ),
          Image.network(
            product.thumbnail,
            fit: BoxFit.contain,
          ).aspectRatio(1.8),
          "₹${product.price}".text.semiBold.base.color(kcPrimaryColor).make(),
          product.name.text.xl.bold.maxLines(1).make(),
          "${product.weight}g".text.base.hexColor("#868889").make(),
          Divider(
            indent: baseline_3x,
            endIndent: baseline_3x,
            color: kcPrimaryColor.withValues(alpha: .5),
            thickness: 1.5,
          ),
          "Add to Cart".text.color(kcPrimaryColor).semiBold.make(),
        ],
      ).p8(),
    ).onInkTap(() {
      locator<NavigationService>()
          .navigateToProductDetailsView(product: product);
    });
  }
}
