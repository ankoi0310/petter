import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';

@freezed
abstract class Favorite with _$Favorite {
  const factory Favorite({
    required String id,
    required String uid,
    required String petId,
  }) = _Favorite;
}
