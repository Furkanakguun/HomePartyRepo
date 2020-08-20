class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotel/home_party-2.png',
      titleTxt: 'Miami Tampa Tekila Shot Party',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 3,
    ),
    HotelListData(
      imagePath: 'assets/hotel/home_party-3.png',
      titleTxt: 'Angora Viskini al gel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 10,
    ),
    HotelListData(
      imagePath: 'assets/hotel/home_party-4.png',
      titleTxt: 'Istanbul Nisantasi Terasta Jakuzi Partisi',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 2,
    ),
    HotelListData(
      imagePath: 'assets/hotel/home_party-3.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 4,
    ),
    HotelListData(
      imagePath: 'assets/hotel/home_party-5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 5,
    ),
  ];
}
