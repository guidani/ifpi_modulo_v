class Post {
  final int id;
  final int user_id;
  final String title;

  Post({required this.id, required this.user_id, required this.title});

  factory Post.fromJson(Map<String, dynamic> item) {
    return Post(
      id: item['id'],
      user_id: item['userId'],
      title: item['title']
    );
  }
}
