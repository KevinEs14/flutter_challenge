class ItemModel {
  final int id;
  final String title;
  final String body;

  ItemModel({required this.id, required this.title, required this.body});

  factory ItemModel.fromJson(Map<String, dynamic> json){
    return ItemModel(
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }
}