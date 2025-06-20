import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/ifsai.dart';

part 'start_remote_response.freezed.dart';
part 'start_remote_response.g.dart';

@freezed
class StartIfsaiResponse with _$StartIfsaiResponse {
  const StartIfsaiResponse._();

  const factory StartIfsaiResponse({
    required bool isServerConnected,
    String? appVersion,
    String? marketDataVersion,
  }) = _StartIfsaiResponse;

  factory StartIfsaiResponse.fromJson(Map<String, dynamic> json) =>
      _$StartIfsaiResponseFromJson(json);

  Ifsai toModel() {
    return Ifsai(
      isServerConnected: isServerConnected,
      appVersion: appVersion ?? '',
      marketDataVersion: marketDataVersion ?? '',
    );
  }
}
