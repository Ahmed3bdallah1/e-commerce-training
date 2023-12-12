import 'package:e_commerce_training/core/cubit/favorite/favorite_cubit.dart';
import 'package:e_commerce_training/core/cubit/favorite/favorite_state.dart';
import 'package:e_commerce_training/screens/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product/laptop_modl.dart';

class FavoriteScreen extends StatelessWidget {
  final List<LaptopModel> laptops;

  const FavoriteScreen({super.key, required this.laptops});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          FavoriteCubit cubit = FavoriteCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              backgroundColor: Colors.grey[200],
              title: const Text('Favorite'),
              centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  if (cubit.favoriteModel!.products!.isNotEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .72,
                      child: ListView.builder(
                        itemCount: cubit.favoriteModel!.products!.length,
                        itemBuilder: (context, index) {
                          return FavoriteItem(
                              products: cubit.favoriteModel!.products![index],
                              laptop: laptops[index]);
                        },
                      ),
                    ),
                  if (cubit.favoriteModel!.products!.isEmpty)
                    const Center(
                      child: Text('Favorites Is Empty'),
                    ),
                ])),
          );
        });
  }
}
