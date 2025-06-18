import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileTechPlayer extends StatefulWidget {
  const MobileTechPlayer({super.key});

  @override
  State<MobileTechPlayer> createState() => _MobileTechPlayerState();
}

class _MobileTechPlayerState extends State<MobileTechPlayer> {
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
        padding: EdgeInsets.only(bottom: 32.h),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isFocused ? 320.w : 260.w,
          height: 48.h,
          decoration: BoxDecoration(
            color:
                isFocused
                    ? Colors.white
                    : Colors.grey.shade800.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(24.r),
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
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            cursorColor: isFocused ? Colors.black : Colors.white,
            controller: _searchController,
            focusNode: _searchFocusNode,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: isFocused ? ' 곧 elastic search가 적용됩니다!' : '기술 검색하기',
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 12.w, right: 8.w),
                child: Icon(Icons.search, color: Colors.grey.shade600),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 48.w,
                minHeight: 48.h,
              ),
              hintStyle: GoogleFonts.montserrat(
                color: Colors.grey.shade600,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
