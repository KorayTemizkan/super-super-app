import 'package:flutter/material.dart';

class TitleWithSeeAll extends StatelessWidget {
  final String text;
  final String routeSource;
  const TitleWithSeeAll({super.key, required this.text, this.routeSource = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextButton(
            onPressed: () {
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(
              "See All",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
