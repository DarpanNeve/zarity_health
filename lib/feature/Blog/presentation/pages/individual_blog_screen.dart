import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blog_bloc.dart';

class IndividualBlogScreen extends StatefulWidget {
  final String id;

  const IndividualBlogScreen({super.key, required this.id});

  @override
  State<IndividualBlogScreen> createState() => _IndividualBlogScreenState();
}

class _IndividualBlogScreenState extends State<IndividualBlogScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<BlogBloc>().add(FetchIndividualBlog(id: widget.id));
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    context.read<BlogBloc>().add(FetchBlogPosts());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogBloc, BlogState>(
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

        if (state is IndividualBlogLoaded) {
          final blog = state.blog;
          return Scaffold(
            appBar: AppBar(
              title: Text(blog.title),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: blog.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      blog.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      blog.summary,
                      style: const TextStyle(fontSize: 16),
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text("No data"),
        );
      },
    );
  }
}
