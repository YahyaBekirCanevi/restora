var data = [
  DataModel(
    imgUrl:
        'https://www.cumhuriyet.com.tr/Archive/2020/11/21/1792779/kapak_164013.jpg',
    name: 'Bostan Pizza',
    location: 'Eskişehir',
    star: 4.6,
  ),
  DataModel(
    imgUrl:
        'https://cdn.yemek.com/mncrop/940/625/uploads/2016/05/ev-yapimi-hamburger.jpg',
    name: 'Crux Burger',
    location: 'Eskişehir',
    star: 4.1,
  ),
  DataModel(
    imgUrl:
        'https://img.piri.net/mnresize/900/-/resim/imagecrop/2020/09/01/10/40/resized_af100-e7e14fc1intro1584646886.jpg',
    name: 'Görenler',
    location: 'Eskişehir',
    star: 4.3,
  ),
  DataModel(
    imgUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnXQr26xrL2JKdPrsnjkcFMb3o0-ZL2XjTpQ&usqp=CAU',
    name: 'Aksen Kahve',
    location: 'Eskişehir',
    star: 3.8,
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
