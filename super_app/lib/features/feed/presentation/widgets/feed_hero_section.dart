import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Image.network(
              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/24/61/95/89/the-met-fifth-avenue.jpg?w=900&h=500&s=1',
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
              // TODO: Bu benim eski yöntemdi ama başka nasıl yapabiliriz
              color: Colors.black.withOpacity(0.5), // %50 siyah katman
              colorBlendMode: BlendMode.darken, // Resmi karartma modu
            ),

            Positioned(
              bottom: 24,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome\nto The Met',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Plan Your Visit', style: TextStyle(color: Colors.white),),
                    icon: Icon(Icons.museum),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                      iconColor: Colors.white,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
