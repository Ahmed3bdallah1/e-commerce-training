import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_training/core/managers/Lists.dart';
import 'package:e_commerce_training/core/managers/constants_colors.dart';
import 'package:e_commerce_training/models/product/laptop_modl.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  final LaptopModel laptopModel;

  final List<String> images;

  const ProductDetails(
      {super.key, required this.laptopModel, required this.images});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late PageController controller;
  double opacity = 0;

  @override
  void initState() {
    controller = PageController();
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        decoration:
            BoxDecoration(gradient: ConstantsColors().linearGradientWhiteBlue),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 10 / 8,
                  child: Stack(fit: StackFit.expand, children: [
                    PageView.builder(
                      itemCount: widget.images.length,
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.transparent),
                          child: CachedNetworkImage(
                              imageUrl: widget.laptopModel.images[index],
                              imageBuilder: (context, imageProvider) =>
                                  Image(image: imageProvider),
                              placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.black),
                                  ),
                              errorWidget: (context, url, error) {
                                print(error.toString());
                                return Center(
                                    child: CircularProgressIndicator(
                                        color: HexColor('#07094D')));
                              }),
                        );
                      },
                    ),
                    Positioned(
                        bottom: 0,
                        left: width * .45,
                        height: 20,
                        child: SmoothPageIndicator(
                          effect: const WormEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              dotColor: Colors.indigo,
                              type: WormType.underground,
                              activeDotColor: Colors.white),
                          controller: controller,
                          count: images.length,
                        )),
                    Positioned(
                        right: 10,
                        bottom: 0,
                        child: FloatingActionButton(
                            backgroundColor: Colors.red.shade900,
                            foregroundColor: Colors.white,
                            onPressed: () {},
                            child: const Icon(Icons.favorite_border, size: 30)))
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
                                  gradient:
                                      ConstantsColors().linearGradientBlue,
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
                                    gradient:
                                        ConstantsColors().linearGradientBlue,
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
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeInExpo,
                          child: Text(widget.laptopModel.description)),
                      const SizedBox(height: 30),
                      Center(
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.indigo,
                                      borderRadius: BorderRadius.circular(20)),
                                  width: 150,
                                  height: 40,
                                  child: const Center(
                                      child: Text("Add to card",
                                          style: TextStyle(
                                              color: Colors.white)))))),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
