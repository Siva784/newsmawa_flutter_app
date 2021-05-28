class Catergory {
  // ignore: non_constant_identifier_names
  String cat_name;
  // ignore: non_constant_identifier_names
  String cat_img;
  // ignore: non_constant_identifier_names
  Catergory(String cat_name, String cat_img) {
    this.cat_name = cat_name;
    this.cat_img = cat_img;
  }
}

// ignore: non_constant_identifier_names
List<Catergory> all_cats = [
  Catergory("general",
      "https://ak.picdn.net/shutterstock/videos/4001887/thumb/1.jpg"),
  Catergory("business", "https://static.dw.com/image/47219195_401.png"),
  Catergory("technology",
      "https://d6fiz9tmzg8gn.cloudfront.net/wp-content/uploads/2019/02/15tech-Banner.jpg"),
  Catergory("entertainment",
      "https://s3images.zee5.com/wp-content/uploads/sites/7/2021/04/Vakeel-Saab-Beats-Master--784x441.jpg"),
  Catergory("health",
      "https://images.myupchar.com/5303/original/swasthya-samachar-health-news-in-hindi.png"),
  Catergory("science",
      "https://www.rmit.edu.au/content/dam/rmit/au/en/study-with-us/interest-areas/thumbnails/science-study-area-1220x732.jpg"),
  Catergory("sports",
      "https://www.sportsnasha.com/wp-content/uploads/2017/09/SN.jpg"),
];
