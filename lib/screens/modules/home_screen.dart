import 'package:e_commerce_training/core/cubit/product/product_cubit.dart';
import 'package:e_commerce_training/core/cubit/product/product_state.dart';
import 'package:e_commerce_training/core/managers/constants_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        if (cubit.productModel == null) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(
            body: Container(
              decoration:
                  BoxDecoration(gradient: ConstantsColors().linearGradientNeon),
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
                                  fontSize: 24, color: Colors.white),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        )
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
                                crossAxisSpacing: 5),
                        itemBuilder: (_, index) {
                          return ProductItem(
                              laptops: cubit.productModel!.product,
                              index: index);
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
