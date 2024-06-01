import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/blog.dart';
import '../../../domain/repositories/blog_repository.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc(this.blogRepository) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) {
      // TODO: implement event handler
      emit(BlogLoading());
    });
    on<FetchBlogPosts>((event, emit) async {
      try {
        final data = await blogRepository.getBlogs();
        emit(BlogLoaded(data));
      } catch (e) {
        emit(const BlogError("Error"));
      }
    });
    on<FetchIndividualBlog>((event, emit) async {
      try {
        final data = await blogRepository.getBlogById(event.id);
        emit(IndividualBlogLoaded(data));
      } catch (e) {
        emit(const BlogError("Error"));
      }
    });
  }
}
