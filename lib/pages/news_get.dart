import 'package:http/http.dart';
import 'dart:convert';

class NewsGet {
  String title;
  String description;
  String url;
  String urlToImage;
  List<Articals> articals1 = [];
  List<Articals> articals2 = [];
  Future getnews() async {
    try {
      articals1 = [];
      var response = await get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=78087e8ce8b74c65a8f55373a1e1c332'));
      Map result = jsonDecode(response.body);

      if (result['status'] == "ok") {
        await result['articles'].forEach((element) {
          if (element['title'] != null &&
              element['description'] != null &&
              element['url'] != null &&
              element['urlToImage'] != null) {
            Articals newart = new Articals(element['title'],
                element['description'], element['url'], element['urlToImage']);
            articals1.add(newart);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future getnews1(String category) async {
    try {
      articals2 = [];

      var response = await get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=78087e8ce8b74c65a8f55373a1e1c332'));
      Map result1 = jsonDecode(response.body);

      if (result1['status'] == "ok") {
        await result1['articles'].forEach((element) {
          if (element['title'] != null &&
              element['description'] != null &&
              element['url'] != null &&
              element['urlToImage'] != null) {
            Articals newart = new Articals(element['title'],
                element['description'], element['url'], element['urlToImage']);
            articals2.add(newart);
          }
        });
      }
    } catch (e) {
      print(e);
      print("error");
    }
  }
}

class Articals {
  String title;
  String description;
  String url;
  String urlToImage;
  Articals(title, description, url, urlToImage) {
    this.title = title;
    this.description = description;
    this.url = url;
    this.urlToImage = urlToImage;
  }
}
