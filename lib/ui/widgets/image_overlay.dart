import 'package:flutter/material.dart';

class ImageOverlay extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const ImageOverlay({required this.imageUrl, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Warna shadow
              blurRadius: 5.0, // Besar blur shadow
              spreadRadius: 2.0, // Besar penyebaran shadow
              offset: const Offset(0, 2), // Posisi offset shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0), // Border radius
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0), // Border radius
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
