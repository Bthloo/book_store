import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookItem extends StatelessWidget {
  String? imageUrl;
  String? name;
  String? price;
  num? priceAfterDiscount;
  BookItem({super.key,
    this.imageUrl,
    required this.name,
    required this.price,
    required this.priceAfterDiscount

  });
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [Column(
          children: [
            Container(
              width: 145,
              height: 213,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(25)
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
              ),
              child:  CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl??'',
                placeholder: (context, url) => SizedBox(
                    width: double.infinity,
                    height: 260,
                    child: Shimmer.fromColors(
                      baseColor: const Color(0xff56528c),
                      highlightColor: const Color(0xff8ee6f1),
                      child: Container(color: Colors.grey,),)),


                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
                padding: EdgeInsets.all(6),
                width: 145,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
                ),
                child: Center(child: Container(color: Colors.black,
                    child: Text(name??'',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)))
            ),
          ],
        ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(10),
             // backgroundColor: Color(0xffF5C518),
              //radius: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffF5C518)
              ),
              child: Column(
                children: [
                  Text('${price?.substring(0,3)}',style: const TextStyle(overflow: TextOverflow.clip,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black54,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black54

                  ),),
                  //SizedBox(height: 5,),
                  Text('$priceAfterDiscount',style: const TextStyle(overflow: TextOverflow.clip,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black
                  ),),

                ],
              ),
            ),
          )
        ]
    );
  }
}


//
// Container(
// width: 145,
// clipBehavior: Clip.antiAliasWithSaveLayer,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(25)
// ),
// child: Text(name??'',style: TextStyle(color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,))
