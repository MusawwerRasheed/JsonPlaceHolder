import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jsonplaceholder/Data/Repositories/Products/products_repository.dart';
import 'package:jsonplaceholder/Presentation/Widget/Controller/States/Posts_states.dart'; 
 
 
class PostCubit extends Cubit<PostState> {
  final PostRepository repository;

  PostCubit(this.repository) : super(PostState.initial());

  Future<void> fetchPosts() async {
    emit(PostState.loading());
    try {
      final posts = await repository.fetchPosts();
      emit(PostState.success(posts));
    } catch (e) {
      emit(PostState.error('Failed to load posts'));
    }
  }
}
