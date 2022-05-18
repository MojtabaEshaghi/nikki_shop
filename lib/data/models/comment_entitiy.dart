/// id : 7
/// title : "خیلی شیک و اسپرته"
/// content : "واقعا یکی از بهترین کفش هاییه که تا حالا دیدم خیلی خوبه"
/// date : "۱۳۹۸.۲۹.۱۴, ۰۲:۰۴"
/// author : {"email":"saeedshahiniit@gmail.com"}

class CommentEntity {
  CommentEntity({
      int? id, 
      String? title, 
      String? content, 
      String? date, 
      Author? author,}){
    _id = id;
    _title = title;
    _content = content;
    _date = date;
    _author = author;
}

  CommentEntity.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _date = json['date'];
    _author = json['author'] != null ? Author.fromJson(json['author']) : null;
  }
  int? _id;
  String? _title;
  String? _content;
  String? _date;
  Author? _author;
CommentEntity copyWith({  int? id,
  String? title,
  String? content,
  String? date,
  Author? author,
}) => CommentEntity(  id: id ?? _id,
  title: title ?? _title,
  content: content ?? _content,
  date: date ?? _date,
  author: author ?? _author,
);
  int? get id => _id;
  String? get title => _title;
  String? get content => _content;
  String? get date => _date;
  Author? get author => _author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['content'] = _content;
    map['date'] = _date;
    if (_author != null) {
      map['author'] = _author?.toJson();
    }
    return map;
  }

}

/// email : "saeedshahiniit@gmail.com"

class Author {
  Author({
      String? email,}){
    _email = email;
}

  Author.fromJson(dynamic json) {
    _email = json['email'];
  }
  String? _email;
Author copyWith({  String? email,
}) => Author(  email: email ?? _email,
);
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}