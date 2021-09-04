import 'package:flutter/rendering.dart';
import 'package:yoo_pizza/views/utils/app_images.dart';

class Ingredients {
  const Ingredients(this.image, this.imageUnit, this.position);
  final String image;
  final String imageUnit;
  final List<Offset> position;
  bool compare(Ingredients ingredients) => ingredients.image == image;
}

final ingredients = const <Ingredients>[
  Ingredients(
    AppImages.chili,
    AppImages.chiliUnit,
    <Offset>[
      Offset(0.2, 0.2),
      Offset(0.6, 0.2),
      Offset(0.4, 0.2),
      Offset(0.5, 0.2),
      Offset(0.4, 0.2),
    ],
  ),
  Ingredients(
    AppImages.mushroom,
    AppImages.mushroomUnit,
    <Offset>[
      Offset(0.2, 0.35),
      Offset(0.65, 0.35),
      Offset(0.3, 0.23),
      Offset(0.5, 0.2),
      Offset(0.3, 0.5),
    ],
  ),
  Ingredients(
    AppImages.olive,
    AppImages.oliveUnit,
    <Offset>[
      Offset(0.25, 0.35),
      Offset(0.65, 0.6),
      Offset(0.2, 0.3),
      Offset(0.4, 0.2),
      Offset(0.2, 0.6),
    ],
  ),
  Ingredients(
    AppImages.onion,
    AppImages.onionUnit,
    <Offset>[
      Offset(0.2, 0.65),
      Offset(0.65, 0.3),
      Offset(0.25, 0.25),
      Offset(0.45, 0.35),
      Offset(0.4, 0.65),
    ],
  ),
  Ingredients(
    AppImages.pea,
    AppImages.peaUnit,
    <Offset>[
      Offset(0.2, 0.35),
      Offset(0.65, 0.35),
      Offset(0.3, 0.23),
      Offset(0.5, 0.2),
      Offset(0.3, 0.5),
    ],
  ),
  Ingredients(
    AppImages.pickle,
    AppImages.pickleUnit,
    <Offset>[
      Offset(0.2, 0.65),
      Offset(0.65, 0.3),
      Offset(0.25, 0.25),
      Offset(0.45, 0.35),
      Offset(0.4, 0.65),
    ],
  ),
  Ingredients(
    AppImages.potato,
    AppImages.potatoUnit,
    <Offset>[
      Offset(0.2, 0.2),
      Offset(0.6, 0.2),
      Offset(0.4, 0.25),
      Offset(0.5, 0.3),
      Offset(0.4, 0.65),
    ],
  ),
];
