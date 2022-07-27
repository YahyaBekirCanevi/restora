var data = [
  DataModel(
    imgUrl:
        'https://b.zmtcdn.com/data/pictures/1/5915941/768d439eee9e1cf9f69fd85c7f8aa265_featured_v2.jpg?output-format=webp',
    name: 'Lacivert Restaurant',
    location: 'Anadolu Hisarı Merkez, İstanbul',
    star: 4.4,
  ),
  DataModel(
    imgUrl:
        'https://b.zmtcdn.com/data/pictures/7/5904847/add338c21c3706fa163b529d47cf18e1_featured_v2.jpg?output-format=webp',
    name: 'Firuzende Restaurant - Anemon Hotels',
    location: 'Anemon Hotels, Galata, Beyoğlu, İstanbul',
    star: 4.4,
  ),
  DataModel(
    imgUrl:
        'https://b.zmtcdn.com/data/pictures/5/5913675/4e198b40a3d6e829c1af3b01c0b2f95f_featured_v2.jpg',
    name: 'Kız Kulesi Restaurant',
    location: 'Salacak, İstanbul',
    star: 4.1,
  ),
  DataModel(
    imgUrl:
        'https://b.zmtcdn.com/data/pictures/chains/6/5905226/73e38751067bdb803a3efa15410f9cb8_featured_v2.jpg',
    name: 'İnari Omakase Japanese Restaurant',
    location: 'Kuruçeşme, İstanbul',
    star: 4.8,
  ),
];

class DataModel {
  final String imgUrl, name, location;
  final double star;

  DataModel({
    required this.imgUrl,
    required this.name,
    required this.location,
    required this.star,
  });
}
