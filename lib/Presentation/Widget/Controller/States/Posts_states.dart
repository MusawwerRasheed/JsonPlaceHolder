import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder/Domain/Models/posts_model.dart';
import 'package:equatable/equatable.dart';
 
class PostState extends Equatable {
  final List<Post> posts;
  final String error;
  final bool isLoading;

  PostState({required this.posts, required this.isLoading, required this.error});

  factory PostState.initial() {
    return PostState(posts: [], isLoading: false, error: '');
  }

  factory PostState.loading() {
    return PostState(posts: [], isLoading: true, error: '');
  }

  factory PostState.success(List<Post> posts) {
    return PostState(posts: posts, isLoading: false, error: '');
  }

  factory PostState.error(String error) {
    return PostState(posts: [], isLoading: false, error: error);
  }

  @override
  List<Object?> get props => [posts, isLoading, error];
}
