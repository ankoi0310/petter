import 'package:mime/mime.dart';
import 'package:petter/core/gen/assets.gen.dart';

bool isImageFile(String path) {
  final mimeType = lookupMimeType(path);
  return mimeType != null && mimeType.startsWith('image');
}

String extractPathFromStorage(String url) {
  final uri = Uri.parse(url);
  final cleanPath = uri.path;
  return cleanPath.split('/object/public/images/').last;
}

final List<AssetGenImage> _defaultAvatars = [
  Assets.images.species.cat,
  Assets.images.species.bird,
  Assets.images.species.dog,
  Assets.images.species.rabbit,
];

AssetGenImage pickDefaultAvatar(String uid) {
  final index = uid.hashCode.abs() % _defaultAvatars.length;
  return _defaultAvatars[index];
}
