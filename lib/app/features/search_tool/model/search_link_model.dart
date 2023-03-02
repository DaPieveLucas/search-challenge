// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SearchLinkModel {
  final String? title;
  final String? link;

  SearchLinkModel({this.title, this.link});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'link': link,
    };
  }

  factory SearchLinkModel.fromMap(Map<String, dynamic> map) {
    return SearchLinkModel(
      title: map['title'] != null ? map['title'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchLinkModel.fromJson(String source) =>
      SearchLinkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
