//TODO: 갤러리 권한 리펙터링 => 위치 권한 처럼

// // 각종 권한 설정에 필요한 파일입니다.

// // 갤러리 권한 설정
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:my_dream/coreService/provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';

// Future<bool> requestGalleryPermission() async {
//   PermissionStatus status = await Permission.photos.status;
//   if (status.isDenied) {
//     await Permission.photos.request();
//   }
//   return status.isGranted;
// }

// /*

// */


