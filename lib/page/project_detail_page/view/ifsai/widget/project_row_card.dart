import 'package:flutter/material.dart';

class TechCategory {
  final String title;
  final List<String> items;

  const TechCategory({required this.title, required this.items});
}

class ProjectRowCard extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final String title;
  final List<TechCategory> techCategories;

  const ProjectRowCard({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.title,
    required this.techCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 60),
        SizedBox(
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imagePath),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          imageDescription,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 80),
        SizedBox(
          width: 1500,
          child: Wrap(
            spacing: 40,
            runSpacing: 60,
            alignment: WrapAlignment.center,
            children:
                techCategories
                    .map(
                      (category) => SizedBox(
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...category.items.map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '• $item',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
