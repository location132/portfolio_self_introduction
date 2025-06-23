import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'dart:ui_web' as ui_web;

class VideoPlayerWithGSShop extends StatelessWidget {
  final String videoUrl;
  final String title;
  final String description;
  final bool isLeft;
  final double circular;

  const VideoPlayerWithGSShop({
    super.key,
    required this.videoUrl,
    this.title = '문제 상황 시연 영상',
    this.description = '검색 시 화면 번쩍임 현상',
    this.isLeft = true,
    this.circular = 12,
  });

  @override
  Widget build(BuildContext context) {
    final String viewId = 'video-player-${videoUrl.hashCode}';

    ui_web.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
      final videoElement =
          web.HTMLVideoElement()
            ..src = videoUrl
            ..controls = true
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.objectFit = 'contain'
            ..style.backgroundColor = '#1a1a1a'
            ..style.borderRadius = '12px'
            ..autoplay = false
            ..muted = true
            ..preload = 'metadata';

      return videoElement;
    });

    return Column(
      children: [
        Container(
          height: 700,
          width: 330,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(circular),
            border: Border.all(color: Colors.grey[600]!, width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(circular),
            child: HtmlElementView(viewType: viewId),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 350,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment:
                isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
