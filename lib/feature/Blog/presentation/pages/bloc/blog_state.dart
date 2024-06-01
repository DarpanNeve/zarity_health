part of 'blog_bloc.dart';

sealed class BlogState extends Equatable {
  const BlogState();
}

final class BlogInitial extends BlogState {
  @override
  List<Object> get props => [];
}

final class BlogLoading extends BlogState {
  @override
  List<Object> get props => [];
}

final class BlogLoaded extends BlogState {
  final List<Blog> blogs;

  const BlogLoaded(this.blogs);

  @override
  List<Object> get props => [blogs];
}

final class BlogError extends BlogState {
  final String message;

  const BlogError(this.message);

  @override
  List<Object> get props => [message];
}

final class IndividualBlogLoaded extends BlogState {
  final Blog blog;

  const IndividualBlogLoaded(this.blog);

  @override
  List<Object> get props => [blog];
}
