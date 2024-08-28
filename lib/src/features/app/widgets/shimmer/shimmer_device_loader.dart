import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerImage extends StatelessWidget {
  const ShimmerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      margin: const EdgeInsets.all(8),
      child: Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.blueGrey.shade100,
        child: Card(
         child: Column(
           children: [
             Row(
               children: [
                 Container(
                   margin: const EdgeInsets.only(left: 12, right: 6),
                   height: 35,
                   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade50),
                 ),
                 SizedBox(
                   width: 180,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const SizedBox(
                         height: 6,
                       ),
                       Container(
                         width: 100,
                         height: 10,
                         color: Colors.grey,
                       ),
                       const SizedBox(
                         height: 6,
                       ),
                       Container(
                         width: 100,
                         height: 10,
                         color: Colors.grey,
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ],
         )
        ),
      ),
    );
  }
}
