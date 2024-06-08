import 'package:hive/hive.dart';

part 'blog.g.dart';

@HiveType(typeId: 0)
class Blog {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String summary;

  Blog({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.summary,
  });

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
