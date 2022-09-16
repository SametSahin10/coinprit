import 'package:json_annotation/json_annotation.dart';

part 'microsoft_oauth_access_token_model.g.dart';

@JsonSerializable()
class MicrosoftOAuthAccessTokenModel {
  final String accessToken;

  const MicrosoftOAuthAccessTokenModel({required this.accessToken});

  factory MicrosoftOAuthAccessTokenModel.fromJson(Map<String, dynamic> json) {
    return _$MicrosoftOAuthAccessTokenModelFromJson(json);
  }
}
