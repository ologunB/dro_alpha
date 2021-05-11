import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({Key key, this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    const String person =
        'https://firebasestorage.googleapis.com/v0/b/proj-along.appspot.com/o/person.png?alt=media&token=54d54309-fa02-4000-b156-188ee2a38c7f';

    return CachedNetworkImage(
      imageUrl: imageUrl ?? person,
      fit: BoxFit.fill,
      height: 100,
      width: 100,
      placeholder: (BuildContext context, String url) => const Image(
          image: AssetImage('images/placeholder.png'), height: 100, width: 100, fit: BoxFit.fill),
      errorWidget: (BuildContext context, String url, dynamic error) => const Image(
          image: AssetImage('images/placeholder.png'), height: 100, width: 100, fit: BoxFit.fill),
    );
  }
}
