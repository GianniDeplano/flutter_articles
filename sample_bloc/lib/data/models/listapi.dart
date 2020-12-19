import 'package:equatable/equatable.dart';

class SearchApiItemModel extends Equatable {
  final String id;
  final String type;
  final String sectionId;
  final String sectionName;
  final String webPublicationDate;
  final String webTitle;
  final String webUrl;
  final String apiUrl;
  final bool isHosted;
  final String pillarId;
  final String pillarName;

  SearchApiItemModel(
    this.id,
    this.type,
    this.sectionId,
    this.sectionName,
    this.webPublicationDate,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.isHosted,
    this.pillarId,
    this.pillarName,
  );

  @override
  List<Object> get props => [
        id,
        type,
        sectionId,
        sectionName,
        webPublicationDate,
        webTitle,
        webUrl,
        apiUrl,
        isHosted,
        pillarId,
        pillarName,
      ];

  static SearchApiItemModel fromJson(dynamic item) {
    return SearchApiItemModel(
      item["id"],
      item["type"],
      item["sectionId"],
      item["sectionName"],
      item["webPublicationDate"],
      item["webTitle"],
      item["webUrl"],
      item["apiUrl"],
      item["isHosted"],
      item["pillarId"],
      item["pillarName"],
    );
  }
}
