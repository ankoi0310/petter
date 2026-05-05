import 'package:freezed_annotation/freezed_annotation.dart';

part 'species.freezed.dart';

@freezed
abstract class Species with _$Species {
  const factory Species({
    required String id,
    required String name,
    required String imageUrl,
    required bool isActive,
  }) = _Species;
}
