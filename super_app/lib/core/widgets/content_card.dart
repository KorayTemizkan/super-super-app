import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String subtitle;
  final VoidCallback? onTap;

  const ContentCard({
    super.key,
    required this.title,
    this.imageUrl = '',
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Card(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [

              _buildImage(imageUrl: imageUrl),

              _buildDown(title: title, department: subtitle),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildDown extends StatelessWidget {
  const _buildDown({
    super.key,
    required this.title,
    required this.department,
  });

  final String title;
  final String department;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(
          12,
        ), // İç kısımda kenarlara uzaklıklar
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Ortadan başlasın yazılar
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 2),
            Text(
              department,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buildImage extends StatelessWidget {
  const _buildImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        height: 120,
        width: double.infinity,
        color: Colors.grey,
        child: Image.network(
          imageUrl.isEmpty
              ? 'https://via.placeholder.com/150'
              : imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
    
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Icon(
                Icons.broken_image,
                size: 40,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
