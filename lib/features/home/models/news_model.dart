class NewsModel {
  Map? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: json['source'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'] ??
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ2BpH16CQcCZIYkpMeE6FzOg9wJv_vrEhG24qgzX88UjLffrPS",
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
