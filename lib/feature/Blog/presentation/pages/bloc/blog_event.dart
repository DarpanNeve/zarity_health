part of 'blog_bloc.dart';

sealed class BlogEvent extends Equatable {
  const BlogEvent();
}

class FetchBlogPosts extends BlogEvent {
  @override
  List<Object> get props => [];
}

class FetchIndividualBlog extends BlogEvent {
  final String id;

  const FetchIndividualBlog({required this.id});

  @override
  List<Object> get props => [id];
}
