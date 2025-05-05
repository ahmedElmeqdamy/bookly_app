import 'package:booly_new/feature/home/data/books_model/pdf.dart';

import 'epub.dart';

class AccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Pdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: json['country'],
    viewability: json['viewability'],
    embeddable: json['embeddable'],
    publicDomain: json['publicDomain'],
    textToSpeechPermission: json['textToSpeechPermission'],
    epub: json['epub'] != null ? Epub.fromJson(json['epub']) : null,
    pdf: json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null,
    webReaderLink: json['webReaderLink'],
    accessViewStatus: json['accessViewStatus'],
    quoteSharingAllowed: json['quoteSharingAllowed'],
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'viewability': viewability,
    'embeddable': embeddable,
    'publicDomain': publicDomain,
    'textToSpeechPermission': textToSpeechPermission,
    'epub': epub?.toJson(),
    'pdf': pdf?.toJson(),
    'webReaderLink': webReaderLink,
    'accessViewStatus': accessViewStatus,
    'quoteSharingAllowed': quoteSharingAllowed,
  };
}
