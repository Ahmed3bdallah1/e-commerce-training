import 'package:e_commerce_training/core/managers/constants_colors.dart';
import 'package:e_commerce_training/models/product/laptop_modl.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final LaptopModel laptopModel;

  const ProductDetails({super.key, required this.laptopModel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double opacity = 0;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,elevation: 200,),
        body: Container(
          height: height,
          decoration: BoxDecoration(
              gradient: ConstantsColors().linearGradientWhiteBlue),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                    aspectRatio: 10 / 8,
                    child: Stack(fit: StackFit.expand, children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white12),
                        child: Image.network(widget.laptopModel.image),
                      ),
                    ])),
                const Divider(color: Colors.white12),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.laptopModel.name,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic)),
                        const Divider(color: Colors.white38, thickness: 1),
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    gradient: ConstantsColors().linearGradientBlue,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white)),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 10),
                                    child: Text(widget.laptopModel.company,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)))),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      gradient: ConstantsColors().linearGradientBlue,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white)),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 10),
                                      child: Text(widget.laptopModel.status,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        AnimatedOpacity(
                            opacity: opacity,
                            curve: Curves.easeInOutSine,
                            duration: const Duration(seconds: 2),
                            child:
                                Text('the price: ${widget.laptopModel.price}')),
                        const SizedBox(height: 2),
                        Text('units left: ${widget.laptopModel.countInStock}'),
                        const Divider(color: Colors.white30, thickness: 1),
                        const Text('About this product:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        AnimatedOpacity(
                            opacity: opacity,
                            duration: const Duration(seconds: 3),
                            curve: Curves.easeInExpo,
                            child: Text(widget.laptopModel.description)),
                      ],
                    ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red.shade900,
            foregroundColor: Colors.white,
            onPressed: () {},
            child: const Icon(Icons.favorite)));
  }
}
