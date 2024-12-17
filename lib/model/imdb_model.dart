class TitleModel {
  String? id;
  String? title;
  int? releaseYear;
  ReleaseDate? releaseDate;
  String? titleType;
  ImageData? primaryImage;
  // List<PrincipalCredit>? principalCredits;

  TitleModel({
    this.id,
    this.title,
    this.releaseYear,
    this.releaseDate,
    this.titleType,
    this.primaryImage,
    // this.principalCredits,
  });

  factory TitleModel.fromJson(Map json) {
    return TitleModel(
      id: json['id'] ?? '',
      title: json['titleText']?['text'] ?? '',
      releaseYear: json['releaseYear']?['year'] ?? 0,
      releaseDate: ReleaseDate.fromJson(json['releaseDate'] ?? {}),
      titleType: json['titleType']?['text'] ?? '',
      primaryImage: ImageData.fromJson(json['primaryImage'] ?? {}),
      // principalCredits: ,
    );
  }
}

class ReleaseDate {
  int? month;
  int? day;
  int? year;

  ReleaseDate({
    this.month,
    this.day,
    this.year,
  });

  factory ReleaseDate.fromJson(Map json) {
    return ReleaseDate(
      month: json['month'] ?? 0,
      day: json['day'] ?? 0,
      year: json['year'] ?? 0,
    );
  }
}

class ImageData {
  String? id;
  String? url;
  int? height;
  int? width;

  ImageData({
    this.id,
    this.url,
    this.height,
    this.width,
  });

  factory ImageData.fromJson(Map json) {
    return ImageData(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      height: json['height'] ?? 0,
      width: json['width'] ?? 0,
    );
  }
}

// class PrincipalCredit {
//    List<Credits>? credits = [];
//
//   PrincipalCredit({
//     this.credits
//   });
//
//   factory PrincipalCredit.fromJson(Map json) {
//     return credits;
//   }
// }
//
// class Credits{
//
// }
