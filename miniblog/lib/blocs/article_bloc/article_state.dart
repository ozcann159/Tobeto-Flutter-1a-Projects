// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:miniblog/models/blog.dart';

abstract class ArticleState{}

class ArticlesInitial extends ArticleState{}

class ArticlesLoading extends ArticleState{}

class ArticlesLoaded extends ArticleState {
  final List<Blog> blogs;
  ArticlesLoaded({
    required this.blogs,
  });
  
}

class ArticlesError extends ArticleState{}