// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class SearchLinkModel {
//   final String? title;
//   final String? netAddrress;
//   SearchLinkModel({
//     this.title,
//     this.netAddrress,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'netAddrress': netAddrress,
//     };
//   }

//   factory SearchLinkModel.fromMap(Map<String, dynamic> map) {
//     return SearchLinkModel(
//       title: map['title'] != null ? map['title'] as String : null,
//       netAddrress:
//           map['netAddrress'] != null ? map['netAddrress'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory SearchLinkModel.fromJson(String source) =>
//       SearchLinkModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }

class SearchLinkModel {
  final String? firstName;
  final String? lastName;
  SearchLinkModel({
    this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  factory SearchLinkModel.fromMap(Map<String, dynamic> map) {
    return SearchLinkModel(
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchLinkModel.fromJson(String source) =>
      SearchLinkModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
