// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  const Product(
      {this.images,
      required this.title,
      required this.descripsion,
      required this.dateTime,
      required this.phoneNumber,
      required this.userName,
      required this.adress,
      this.prices});

  final List<String>? images;
  final String title;
  final String descripsion;
  final String dateTime;
  final String phoneNumber;
  final String userName;
  final String adress;
  final String? prices;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'images': images,
      'title': title,
      'descripsion': descripsion,
      'dateTime': dateTime,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'adress': adress,
      'prices': prices,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<String>))
          : null,
      title: map['title'] as String,
      descripsion: map['descripsion'] as String,
      dateTime: map['dateTime'] as String,
      phoneNumber: map['phoneNumber'] as String,
      userName: map['userName'] as String,
      adress: map['adress'] as String,
      prices: map['prices'] != null ? map['prices'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
