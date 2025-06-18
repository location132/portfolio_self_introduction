import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechPlayer extends StatefulWidget {
  const TechPlayer({super.key});

  @override
  State<TechPlayer> createState() => _TechPlayerState();
}

class _TechPlayerState extends State<TechPlayer> {
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isFocused ? 500 : 300,
          height: 48,
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
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: isFocused ? Colors.black : Colors.white,
            controller: _searchController,
            focusNode: _searchFocusNode,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText:
                  isFocused
                      ? '조금 더 편하게 elastic search를 적용할 수 있게 만들어보겠습니다.'
                      : '궁금한 것이 있다면 클릭해주세요',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: Icon(Icons.search, color: Colors.grey.shade600),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              hintStyle: GoogleFonts.montserrat(
                color: Colors.grey.shade600,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
