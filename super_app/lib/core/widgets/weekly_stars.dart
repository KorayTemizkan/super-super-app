import 'package:flutter/material.dart';

class WeeklyStarsCard extends StatelessWidget {
  final int departmentId; // @kullanıcıAdı
  final String displayName; // 540 tığcık
  final VoidCallback? onTap;

  const WeeklyStarsCard({
    super.key,
    required this.departmentId,
    required this.displayName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFF5722), Color(0xFFFF8A50)],
                ),
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: const Icon(Icons.person, color: Color(0xFFFF5722)),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              displayName,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
