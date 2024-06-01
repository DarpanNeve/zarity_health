class Blog {
  final String id;
  final String imageUrl;
  final String title;
  final String summary;

  Blog({required this.id, required this.imageUrl, required this.title, required this.summary});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'summary': summary,
    };
  }
}
