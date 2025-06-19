import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechDetailPlayer extends StatefulWidget {
  final Function(bool) isFocused;
  const TechDetailPlayer({super.key, required this.isFocused});

  @override
  State<TechDetailPlayer> createState() => _TechDetailPlayerState();
}

class _TechDetailPlayerState extends State<TechDetailPlayer> {
  late FocusNode _searchFocusNode;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _searchController = TextEditingController();
    _searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _searchFocusNode.hasFocus;
    widget.isFocused(isFocused);

    return AnimatedAlign(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      alignment: isFocused ? Alignment.center : Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isFocused ? 570 : 330,
          height: isFocused ? 56 : 48,
          decoration: BoxDecoration(
            color:
                isFocused
                    ? Colors.white
                    : Colors.grey.shade800.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade700),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            style: GoogleFonts.montserrat(
              color: isFocused ? Colors.black : Colors.white,
              fontSize: isFocused ? 16 : 14,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: isFocused ? Colors.black : Colors.white,
            controller: _searchController,
            focusNode: _searchFocusNode,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText:
                  isFocused ? '아래의 항목을 선택하거나, 이전 페이지로 돌아가기' : '이전 페이지로 돌아가기',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: isFocused ? 30 : 24,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              hintStyle: GoogleFonts.montserrat(
                color: !isFocused ? Colors.white : Colors.grey.shade600,
                fontSize: isFocused ? 16 : 14,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: isFocused ? 18 : 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
