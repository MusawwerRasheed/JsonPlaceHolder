import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/Domain/Models/posts_model.dart';
import 'package:jsonplaceholder/Presentation/Widget/Controller/post_cubit.dart';
import 'package:jsonplaceholder/Presentation/Widget/Controller/States/Posts_states.dart';
import '../Controller/post_cubit.dart'; 

  
class Postscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postCubit = context.watch<PostCubit>();  
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.error.isNotEmpty) {
            return Center(
              child: Text(state.error),
            );
          } else if (state.posts.isNotEmpty) {
            List<Post> posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].title!),
                  subtitle: Text(posts[index].body!),
                );
              },
            );
          } else {
            return Center(
              child: Text('No posts available.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postCubit.fetchPosts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
