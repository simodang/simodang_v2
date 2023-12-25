class Article {
  final String id;
  final String title;
  final String url;
  final String image;
  final bool published;
  final String createdAt;

  Article({
    required this.id,
    required this.title,
    required this.url,
    required this.image,
    required this.published,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      image: json['image'],
      published: json['published'],
      createdAt: json['createdAt'],
    );
  }
}