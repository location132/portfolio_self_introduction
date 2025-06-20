import 'package:flutter/material.dart';

// 메인 페이지 로딩
class LodingGifIfsai extends StatefulWidget {
  final bool isLoadingFinish;
  const LodingGifIfsai({super.key, required this.isLoadingFinish});

  @override
  State<LodingGifIfsai> createState() => _LodingGifIfsaiState();
}

class _LodingGifIfsaiState extends State<LodingGifIfsai> {
  ImageProvider? _imageProvider;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() {
    _imageProvider = const AssetImage('assets/images/Loading_IFSAI.gif');
  }

  @override
  void dispose() {
    _imageProvider?.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (widget.isLoadingFinish) {
      return const SizedBox.shrink();
    }

    return Center(
      child: IgnorePointer(
        ignoring: widget.isLoadingFinish,
        child: SizedBox(
          height: screenWidth * 0.75,
          child: Image(image: _imageProvider!),
        ),
      ),
    );
  }
}

// 새로고침 로딩
class LodingGifIfsaiTop extends StatefulWidget {
  final bool isLoadingFinish;
  const LodingGifIfsaiTop({super.key, required this.isLoadingFinish});

  @override
  State<LodingGifIfsaiTop> createState() => _LodingGifIfsaiTopState();
}

class _LodingGifIfsaiTopState extends State<LodingGifIfsaiTop> {
  ImageProvider? _imageProvider;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() {
    _imageProvider = const AssetImage('assets/images/Loading_IFSAI.gif');
  }

  @override
  void dispose() {
    _imageProvider?.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoadingFinish) {
      return const SizedBox.shrink();
    }

    return Center(
      child: IgnorePointer(
        ignoring: widget.isLoadingFinish,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 220),
          opacity: !widget.isLoadingFinish ? 1.0 : 0.0,
          child: Image(image: _imageProvider!),
        ),
      ),
    );
  }
}

// 무한 스크롤 로딩
class LodingGifIfsaiSmall extends StatefulWidget {
  final bool isLoadingFinish;
  const LodingGifIfsaiSmall({super.key, required this.isLoadingFinish});

  @override
  State<LodingGifIfsaiSmall> createState() => _LodingGifIfsaiSmallState();
}

class _LodingGifIfsaiSmallState extends State<LodingGifIfsaiSmall> {
  ImageProvider? _imageProvider;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() {
    _imageProvider = const AssetImage('assets/images/Loading_IFSAI.gif');
  }

  @override
  void dispose() {
    _imageProvider?.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (widget.isLoadingFinish) {
      return const SizedBox.shrink();
    }

    return Center(
      child: IgnorePointer(
        ignoring: widget.isLoadingFinish,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 220),
          opacity: !widget.isLoadingFinish ? 1.0 : 0.0,
          child: SizedBox(
            height: screenWidth * 0.2,
            child: Image(image: _imageProvider!),
          ),
        ),
      ),
    );
  }
}
