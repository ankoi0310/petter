import 'package:petter/core/gen/assets.gen.dart';

enum Species {
  cat(label: 'Mèo'),
  dog(label: 'Chó'),
  bird(label: 'Chim'),
  rabbit(label: 'Thỏ'),
  mouse(label: 'Chuột');

  const Species({required this.label});

  final String label;

  AssetGenImage get asset => switch (this) {
    cat => Assets.images.species.cat,
    dog => Assets.images.species.dog,
    bird => Assets.images.species.bird,
    rabbit => Assets.images.species.rabbit,
    _ => Assets.images.logo,
  };
}

final List<Species> homeSpecies = [
  Species.dog,
  Species.cat,
  Species.bird,
  Species.rabbit,
];
