class Todo {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  Todo({
    this.id= '',
    this.title= '',
    this.description= '',
    this.isCompleted= false,
  });

  /// convert [Todo] to json
  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "is_completed": isCompleted,
  };
  

  /// convert json to [Todo]
  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    isCompleted: json["is_completed"],
  );

  @override
  String toString() {
    return "Todo { id: $id, title: $title, description: $description, isCompleted: $isCompleted }";
  }
}