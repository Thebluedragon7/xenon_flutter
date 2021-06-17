import 'package:flutter/material.dart';
import 'nobleout.dart';

// ignore: non_constant_identifier_names
List<gases> noble_gases = [
  gases(
      element: 'Helium',
      sym: 'He',
      dlink: 'helium_d.jpg',
      tblink: 'helium.jpg',
      atno: 2,
      atwt: 4.002602,
      econfig: '1s\u00B2'),
  gases(
      element: 'Neon',
      sym: 'Ne',
      dlink: 'neon_d.jpg',
      tblink: 'neon.jpg',
      atno: 10,
      atwt: 20.1797,
      econfig: '2s\u00B2,2p\u2076'),
  gases(
      element: 'Argon',
      sym: 'Ar',
      dlink: 'argon_d.jpg',
      tblink: 'argon.jpg',
      atno: 18,
      atwt: 39.948,
      econfig: '3s\u00B2,3p\u2076'),
  gases(
      element: 'Krypton',
      sym: 'Kr',
      dlink: 'krypton_d.jpg',
      tblink: 'krypton.jpg',
      atno: 36,
      atwt: 83.798,
      econfig: '3d\u00B9\u2070,4s\u00B2,4p\u2076'),
  gases(
      element: 'Xenon',
      sym: 'Xe',
      dlink: 'xenon_d.jpg',
      tblink: 'xenon.jpg',
      atno: 54,
      atwt: 131.293,
      econfig: '4d\u00B9\u2070,5s\u00B2,5p\u2076'),
  gases(
      element: 'Radon',
      sym: 'Rn',
      dlink: 'radon_d.jpg',
      tblink: 'radon.jpg',
      atno: 86,
      atwt: 222.01758,
      econfig: '4f\u00B9\u2074,5d\u00B9\u2070,6s\u00B2,6p\u2076'),
];

List<Widget> gasOut = [
  nobleData(
    noble_gases: noble_gases,
    noble_state: 0,
  ),
  nobleData(
    noble_gases: noble_gases,
    noble_state: 1,
  ),
  nobleData(
    noble_gases: noble_gases,
    noble_state: 2,
  ),
  nobleData(
    noble_gases: noble_gases,
    noble_state: 3,
  ),
  nobleData(
    noble_gases: noble_gases,
    noble_state: 4,
  ),
  nobleData(
    noble_gases: noble_gases,
    noble_state: 5,
  ),
];

const List<nobleElement> nobleElements = const <nobleElement>[
  const nobleElement(title: 'Helium', image: 'images/helium_d.jpg'),
  const nobleElement(title: 'Neon', image: 'images/neon_d.jpg'),
  const nobleElement(title: 'Argon', image: 'images/argon_d.jpg'),
  const nobleElement(title: 'Krypton', image: 'images/krypton_d.jpg'),
  const nobleElement(title: 'Xenon', image: 'images/xenon_d.jpg'),
  const nobleElement(title: 'Radon', image: 'images/radon_d.jpg'),
];

List<String> nameWord = [
  nobleElements[0].title,
  nobleElements[1].title,
  nobleElements[2].title,
  nobleElements[3].title,
  nobleElements[4].title,
  nobleElements[5].title,
];

// ignore: camel_case_types
class gases {
  String element;
  String sym;
  String dlink;
  String tblink;
  int atno;
  double atwt;
  String econfig;

  gases(
      {this.element,
      this.sym,
      this.dlink,
      this.tblink,
      this.atno,
      this.atwt,
      this.econfig});
}

// ignore: camel_case_types
class nobleElement {
  const nobleElement({this.title, this.image});
  final String title;
  final String image;
}
