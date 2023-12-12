import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_training/core/cubit/cart/cart_state.dart';
import 'package:e_commerce_training/core/managers/Lists.dart';
import 'package:e_commerce_training/core/managers/constants_colors.dart';
import 'package:e_commerce_training/core/managers/custom_snak_bar.dart';
import 'package:e_commerce_training/core/managers/navigation.dart';
import 'package:e_commerce_training/models/product/laptop_modl.dart';
import 'package:e_commerce_training/screens/modules/cart_screen.dart';
import 'package:e_commerce_training/screens/modules/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/cubit/cart/cart_cubit.dart';

class ProductItem extends StatelessWidget {
  final List<LaptopModel> laptops;
  final int index;

  const ProductItem({super.key, required this.laptops, required this.index});

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = CartCubit.get(context);
    return InkWell(
      onTap: () {
        images = laptops[index].images;
        navigateToNextScreen(
            context,
            ProductDetails(
              laptopModel: laptops[index],
              images: images,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 180,
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#07094D'),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20)),
                          ),
                          height: 125,
                          child: Center(
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  laptops[index].status,
                                  style: const TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20)),
                                  color: HexColor('#07094D').withOpacity(0.6),
                                  gradient:
                                      ConstantsColors().linearGradientYellow),
                              height: 125,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: CachedNetworkImage(
                                      imageUrl: laptops[index].image,
                                      imageBuilder: (context, imageProvider) =>
                                          Image(image: imageProvider),
                                      placeholder: (context, url) =>
                                          const Center(
                                            child: CircularProgressIndicator(
                                                color: Colors.black),
                                          ),
                                      errorWidget: (context, url, error) {
                                        print(error.toString());
                                        return Center(
                                            child: CircularProgressIndicator(
                                                color: HexColor('#07094D')));
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    laptops[index].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                if (laptops[index].status == 'New')
                                  Expanded(
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: HexColor('#C70000'),
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(20))),
                                      child: const Center(
                                        child: Text(
                                          '10% Off',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 8),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              laptops[index].company,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  '\$${laptops[index].price}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: HexColor('#07094D'),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: BlocConsumer<CartCubit, CartState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return cubit.isProductInCart(index,laptops[index]) ==
                                              true
                                          ? MaterialButton(
                                              onPressed: () {
                                                showSnakBar(context,
                                                    "long press to go to your cart");
                                              },
                                              onLongPress: () {
                                                navigateToNextScreen(
                                                    context,
                                                    CartScreen(
                                                        laptops: laptops));
                                              },
                                              child: Text(
                                                'In cart'.toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          : MaterialButton(
                                              onPressed: () {
                                                cubit.addToCart(context,
                                                    productId:
                                                        laptops[index].id,
                                                    productName:
                                                        laptops[index].name);
                                              },
                                              child: Text(
                                                'Buy'.toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                    },
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
