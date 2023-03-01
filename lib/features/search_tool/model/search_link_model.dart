// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SearchLinkModel {
  final String? title;
  final String? link;
  final String? query;
  SearchLinkModel({this.title, this.link, this.query});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'link': link,
      'query': query,
    };
  }

  factory SearchLinkModel.fromMap(Map<String, dynamic> map) {
    return SearchLinkModel(
      title: map['title'] != null ? map['title'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      query: map['query'] != null ? map['query'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchLinkModel.fromJson(String source) =>
      SearchLinkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class SearchLinkModel {
//   String? name;
//   String? job;
//   String? id;
//   String? createdAt;
//   SearchLinkModel({
//     this.name,
//     this.job,
//     this.id,
//     this.createdAt,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'job': job,
//       'id': id,
//       'createdAt': createdAt,
//     };
//   }

//   factory SearchLinkModel.fromMap(Map<String, dynamic> map) {
//     return SearchLinkModel(
//       name: map['name'] != null ? map['name'] as String : null,
//       job: map['job'] != null ? map['job'] as String : null,
//       id: map['id'] != null ? map['id'] as String : null,
//       createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory SearchLinkModel.fromJson(String source) =>
//       SearchLinkModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }

