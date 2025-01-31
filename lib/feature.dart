import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NoteCard(
          title: "Woody Note",
          description: "Lorem Ipsum is simply dummy text of the printing.",
          imagePath: "lib/icons/f1.png",
          color: Color(0xFF9B5A3C),
        ),
        SizedBox(height: 16),
        NoteCard(
          title: "Sandle Wood",
          description: "Lorem Ipsum is simply dummy text of the printing.",
          imagePath: "lib/icons/f2.png",
          color: Color(0xFFA67C52),
        ),
        SizedBox(height: 16),
        NoteCard(
          title: "Cotton Candy",
          description: "Lorem Ipsum is simply dummy text of the printing.",
          imagePath: "lib/icons/f3.png",
          color: Color(0xFFE88B66),
        ),
      ],
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color color;

  const NoteCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
