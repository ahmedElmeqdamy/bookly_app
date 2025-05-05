import 'package:booly_new/feature/home/data/books_model/sale_info.dart';
import 'package:booly_new/feature/home/data/books_model/search_info.dart';
import 'package:booly_new/feature/home/data/books_model/volume_info.dart';

import 'access_info.dart';

class BookModel {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
   required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      kind: json['kind']?.toString(),
      id: json['id']?.toString(),
      etag: json['etag']?.toString(),
      selfLink: json['selfLink']?.toString(),
      volumeInfo:
      VolumeInfo.fromJson(json['volumeInfo']),
      saleInfo: json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null,
      accessInfo: json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null,
      searchInfo: json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      'volumeInfo': volumeInfo.toJson(),
      'saleInfo': saleInfo?.toJson(),
      'accessInfo': accessInfo?.toJson(),
      'searchInfo': searchInfo?.toJson(),
    };
  }
}
