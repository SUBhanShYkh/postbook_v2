class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  int comments;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.comments = 0,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
