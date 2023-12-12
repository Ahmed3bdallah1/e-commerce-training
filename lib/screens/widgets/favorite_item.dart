import 'package:e_commerce_training/core/cubit/favorite/favorite_cubit.dart';
import 'package:e_commerce_training/models/favorite_model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../core/managers/Lists.dart';
import '../../core/managers/navigation.dart';
import '../../models/product/laptop_modl.dart';
import '../modules/product_details.dart';

class FavoriteItem extends StatelessWidget {
  final LaptopModel laptop;
  final FavoriteProducts products;

  const FavoriteItem({super.key, required this.products, required this.laptop});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateToNextScreen(
            context, ProductDetails(laptopModel: laptop, images: laptop.images));
      },
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: HexColor('#FEFEFE')),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: HexColor('#535482'),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Image(
                                width: 120,
                                image: NetworkImage(products.image),
                              ),
                            ),
                          ),
                          if (products.status == 'New')
                            Expanded(
                                child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              width: double.infinity,
                              child: const Center(
                                  child: Text(
                                '15% OFF',
                                style: TextStyle(color: Colors.white),
                              )),
                            ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Black',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              FavoriteCubit.get(context)
                                  .deleteFavorite(context,
                                      productId: products.id);
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                                Text('Remove'),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
