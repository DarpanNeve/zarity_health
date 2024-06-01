import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/blog.dart';

abstract interface class BlogRemoteDataSource {
  Future<List<Blog>> getBlogs();

  Future<Blog> getBlogById(String id);
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<Blog>> getBlogs() async {
    try {
      debugPrint('Fetching data from remote');
      final data = await _fireStore.collection('blogs').get();
      debugPrint('Data fetched');
      debugPrint(data.toString());
      return data.docs.map((e) => Blog.fromJson(e.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<Blog> getBlogById(String id) async {
    try {
      final data =
          await _fireStore.collection('blogs').where('id', isEqualTo: id).get();
      return Blog.fromJson(data.docs.first.data());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
