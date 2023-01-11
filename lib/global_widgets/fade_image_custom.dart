import 'package:flutter/material.dart';

class FadeImageCustom extends StatelessWidget {
  const FadeImageCustom({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fadeOutDuration: const Duration(milliseconds: 100),
      fadeInDuration: const Duration(milliseconds: 100),
      image: NetworkImage(image),
      placeholder: const AssetImage('assets/images/loading.gif'),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset('assets/images/pocket_ball.png',
            fit: BoxFit.fitWidth);
      },
      fit: BoxFit.fitWidth,
    );
  }
}
