import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zarity_health_task/feature/Blog/presentation/widgets/blog_view.dart';
import 'bloc/blog_bloc.dart';
import 'individual_blog_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  callback(newValue) {
    context.read<BlogBloc>().add(FetchBlogPosts());
  }

  @override
  void initState() {
    // TODO: implement initState

    context.read<BlogBloc>().add(FetchBlogPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BlogError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is BlogLoaded) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: BlogView(blog: state.blogs[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualBlogScreen(
                          id: state.blogs[index].id,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const Center(
            child: Text("No data"),
          );
        },
      ),
    );
  }
}
