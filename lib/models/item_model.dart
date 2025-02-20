class ItemModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  ItemModel({required this.userId, required this.id, required this.title, required this.body});

  factory ItemModel.fromJson(Map<String, dynamic> json){
    return ItemModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }
}