import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/libraries_widget/library_section.dart';

class LibraryManager {
  static Widget build(BuildContext context, IfsaiState state) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: screenWidth > 1200 ? 1200 : screenWidth * 0.9,
      ),
      child: LibrarySection(state: state),
    );
  }
}
