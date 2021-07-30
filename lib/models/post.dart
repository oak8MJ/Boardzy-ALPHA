class Post {
  final String uid;
  final String image;
  final String title;
  final String? category;

  Post(data, {required this.image, required this.title, required this.category, required this.uid});
}
