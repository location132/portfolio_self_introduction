import 'dart:async';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  final String textEditing;
  final bool? isNaverMap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onEnter;
  final VoidCallback? onTap;

  const Searchbar({
    super.key,
    required this.textEditing,
    this.isNaverMap,
    this.onChanged,
    this.onEnter,
    this.onTap,
  });

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _textEditingController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _textEditingController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 120), () {
      if (widget.isNaverMap == true) {
        if (query.isEmpty) {
          widget.onEnter?.call('');
        }
        return;
      } else {
        widget.onChanged?.call(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: widget.isNaverMap == true
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x0c000000),
                  offset: Offset(2, 0),
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x0c000000),
                  offset: Offset(-2, 0),
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ],
            )
          : null,
      child: TextFormField(
        onTap: widget.onTap,
        controller: _textEditingController,
        cursorHeight: 20,
        textAlignVertical: const TextAlignVertical(y: 0.3),
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          filled: true,
          fillColor: widget.isNaverMap == true
              ? Colors.white
              : const Color(0xfff5f5f5),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Transform.translate(
              offset: const Offset(10, 0),
              child: const Icon(
                Icons.search,
                size: 30,
                color: Color(0xff6fbf8a),
              ),
            ),
          ),
          hintText: widget.textEditing,
          hintStyle: const TextStyle(
            color: Color(0xffc1c1c1),
            fontFamily: 'Pretendard',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
        ),
        onFieldSubmitted:
            widget.isNaverMap == true ? widget.onEnter : _onSearchChanged,
        onChanged: _onSearchChanged,
      ),
    );
  }
}
