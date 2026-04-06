import 'package:flutter/material.dart';
import 'package:grocery_store/ui/common/ui_helpers.dart';
import 'package:grocery_store/ui/widgets/ui/buttons/raised_button.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/data/models/product/product.dart';
import '../../common/app_colors.dart';
import 'product_details_viewmodel.dart';

class ProductDetailsView extends StackedView<ProductDetailsViewModel> {
  final Product product;
  const ProductDetailsView({Key? key, required this.product}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductDetailsViewModel viewModel,
    Widget? child,
  ) {
    final isFavorite =
        viewModel.favorites.map((e) => e.name == product.name).contains(true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => viewModel.addOrRemoveFavorite(product, isFavorite),
            icon: Icon(
              isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        spacing: baseline,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.thumbnail).aspectRatio(1.5),
          product.name.text.xl2.bold.black.make(),
          "${product.rating} ⭐ (${product.reviewsCount} reviews)"
              .text
              .sm
              .semiBold
              .black
              .make(),
          "₹${product.price}".text.semiBold.base.color(kcPrimaryColor).make(),
          baseline_3x.heightBox,
          "Description".text.black.lg.semiBold.make(),
          product.description.text.base.hexColor("#868889").make(),
          baseline_3x.heightBox,
          AppRaisedButton.primary(
            label: "Add to cart",
            onPressed: () {},
          ),
        ],
      ).scrollVertical().p16(),
    );
  }

  @override
  ProductDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductDetailsViewModel();
}
