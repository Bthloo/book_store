import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  String? imageUrl;

  HomeSlider({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(25)
      ),
      child:  CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: imageUrl??'',
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
