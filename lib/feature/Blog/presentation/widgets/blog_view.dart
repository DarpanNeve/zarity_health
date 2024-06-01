import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/blog.dart';

class BlogView extends StatefulWidget {
  final Blog blog;

  const BlogView({super.key, required this.blog});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.blog.imageUrl,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  child: const Text("Read more"),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  }),
            ],
          ),
          Text(widget.blog.title),
          Text(
            widget.blog.summary,
            maxLines: isExpanded ? null : 2,
            // overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
