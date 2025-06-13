import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/libraries/library_data.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/libraries/library_item.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _LibraryCategory(
                title: libraryData[0]['title'],
                libraries: libraryData[0]['libraries'],
              ),
            ),
            const SizedBox(width: 40),

            Expanded(
              child: _LibraryCategory(
                title: libraryData[1]['title'],
                libraries: libraryData[1]['libraries'],
              ),
            ),
            const SizedBox(width: 40),

            Expanded(
              child: _LibraryCategory(
                title: libraryData[2]['title'],
                libraries: libraryData[2]['libraries'],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _LibraryCategory extends StatelessWidget {
  final String title;
  final List<String> libraries;

  const _LibraryCategory({required this.title, required this.libraries});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.3,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),

        ...libraries.map((library) => LibraryItem(library: library)).toList(),
      ],
    );
  }
}
