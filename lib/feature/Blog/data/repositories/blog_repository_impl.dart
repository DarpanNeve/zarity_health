import '../../domain/repositories/blog_repository.dart';
import '../data_sources/blog_remote_data_source.dart';
import '../models/blog.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogDataSource;

  BlogRepositoryImpl({required this.blogDataSource});

  @override
  Future<List<Blog>> getBlogs() async {
    try {
      return await blogDataSource.getBlogs();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Blog> getBlogById(String id) async {
    try {
      return await blogDataSource.getBlogById(id);
    } catch (e) {
      rethrow;
    }
  }
}
