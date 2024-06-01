import '../../data/models/blog.dart';

abstract interface class BlogRepository {
  Future<List<Blog>> getBlogs();

  Future<Blog> getBlogById(String id);
}
