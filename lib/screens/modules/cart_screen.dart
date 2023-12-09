import 'package:e_commerce_training/core/cubit/cart/cart_cubit.dart';
import 'package:e_commerce_training/core/cubit/cart/cart_state.dart';
import 'package:e_commerce_training/screens/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        CartCubit cubit = CartCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            title: const Text('Cart'),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                if (cubit.cartModel!.products!.isNotEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .76,
                    child: ListView.builder(
                      itemCount: cubit.cartModel!.products!.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartProduct: cubit.cartModel!.products![index],
                        );
                      },
                    ),
                  ),
                if (cubit.cartModel!.products!.isEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .76,
                    child: const Center(
                      child: Text('Cart Is Empty'),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: HexColor('#FEFEFE'),
                        borderRadius: BorderRadius.circular(6)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Apply coupon code .....'),
                          const Spacer(),
                          DefaultButton(
                              height: 40,
                              backgroundColor: HexColor('#07094D'),
                              width: 93,
                              childWidget: const Text(
                                'Apply',
                                style: TextStyle(color: Colors.white),
                              ),
                              function: () {}),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
              ])),
        );
      },
    );
  }
}
