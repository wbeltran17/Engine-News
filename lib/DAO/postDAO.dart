import 'package:engine_news/models/post.dart';
import 'package:firebase_database/firebase_database.dart';

class PostDAO {
  final DatabaseReference _postRef =
      FirebaseDatabase.instance.reference().child('posts');

  void savePost(Post post) {
    _postRef.push().set(post.toJson());
  }

  Query getPosts() => _postRef;
}
