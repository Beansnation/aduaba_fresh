import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/OnBoarding1.png',
    title: 'A Cool Way to Get Start',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
  ),
  Slide(
    imageUrl: 'assets/images/OnBoarding2.png',
    title: 'Design Interactive App UI',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
  ),
  Slide(
    imageUrl: 'assets/images/OnBoarding3.png',
    title: 'It\'s Just the Beginning',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus tincidunt bibendum. Maecenas eu viverra orci. Duis diam leo, porta at justo vitae, euismod aliquam nulla.',
  ),
];

//carousel slider CheckoutCard
List items = [
  [
    'assets/svg/visa.svg',
    '3282    .  .  .  .     .  .  .  .    3282',
    'Card Holder',
    'Expires',
    'Aycan Doganlar',
    '12/23',
    '0xFFEB7777'
  ],
  [
    'assets/svg/visa.svg',
    '3282    .  .  .  .     .  .  .  .    3282',
    'Card Holder',
    'Expires',
    'Aycan Doganlar',
    '12/23',
    '0xFFE75A21'
  ],
  [
    'assets/svg/visa.svg',
    '3282    .  .  .  .     .  .  .  .    3282',
    'Card Holder',
    'Expires',
    'Aycan Doganlar',
    '12/23',
    '0xFF7AA0DA'
  ]
];
