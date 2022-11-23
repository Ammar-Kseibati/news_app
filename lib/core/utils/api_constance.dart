class ApiConstance {
  // static const String apiKey = "4e2d126dbc484363a11be165addb138e";
  static const String apiKey = "1cc125228f8348c3b67374ca0caf7582";
  static const String appleArticlesPath =
      "https://newsapi.org/v2/everything?q=apple&from=2022-11-20&to=2022-11-20&sortBy=popularity&apiKey=$apiKey";
  static const String buisnessArticlesPath =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey";

  static const String teslaArticlesPath =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-10-23&sortBy=publishedAt&apiKey=$apiKey";
  static const String wallStreetArticlesPath =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apiKey";
}
