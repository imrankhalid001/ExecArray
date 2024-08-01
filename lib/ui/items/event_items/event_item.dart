import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const EventItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          width: 150,
          height: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: imagePath,
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 150,
                fit: BoxFit.cover,
              ),
              Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Brief description of event Lorem ipsum dolor sit amet....')
              ),
            ],
          ),
        ),
      ],
    );
  }
}
