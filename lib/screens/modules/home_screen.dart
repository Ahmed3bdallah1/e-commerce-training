import 'package:e_commerce_training/core/cubit/cart/cart_cubit.dart';
import 'package:e_commerce_training/core/cubit/favorite/favorite_cubit.dart';
import 'package:e_commerce_training/core/cubit/product/product_cubit.dart';
import 'package:e_commerce_training/core/cubit/product/product_state.dart';
import 'package:e_commerce_training/core/managers/constants_colors.dart';
import 'package:e_commerce_training/models/favorite_model/favorite_model.dart';
import 'package:e_commerce_training/screens/modules/cart_screen.dart';
import 'package:e_commerce_training/screens/modules/favorite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../core/managers/navigation.dart';
import '../../models/cart_model/cart_model.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        CartCubit cartCubit = CartCubit.get(context);
        FavoriteCubit favoriteCubit = FavoriteCubit.get(context);
        if (cubit.productModel == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: ConstantsColors().linearGradientNeon,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cubit.productModel!.product[0].category,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: cubit.productModel!.product.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 280,
                          mainAxisExtent: 260,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (_, index) {
                          return ProductItem(
                            laptops: cubit.productModel!.product,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: SpeedDial(
                icon: Icons.card_travel_outlined,
                backgroundColor: Colors.white38,
                foregroundColor: Colors.white,
                children: [
                  SpeedDialChild(
                      child: FutureBuilder<CartModel>(
                        future: cartCubit.getCartProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          } else {
                            return FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {
                                navigateToNextScreen(
                                    context, const CartScreen());
                              },
                              child: const Icon(
                                CupertinoIcons.cart,
                                color: Colors.black,
                              ),
                            );
                          }
                        },
                      ),
                      label: "Cart"),
                  SpeedDialChild(
                      child: FutureBuilder<FavoriteModel>(
                        future: favoriteCubit.getFavorite(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          } else {
                            return FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () {
                                 favoriteCubit.getFavorite();
                                navigateToNextScreen(
                                    context, const FavoriteScreen());
                              },
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            );
                          }
                        },
                      ),
                      label: "Favorite"),
                ],
                child: const Icon(CupertinoIcons.add),
              ));
        }
      },
    );
  }
}
