// To parse this JSON data, do
//
//     final bookModel = bookModelFromMap(jsonString);

import 'dart:convert';

BookModel bookModelFromMap(String str) => BookModel.fromMap(json.decode(str));

String bookModelToMap(BookModel data) => json.encode(data.toMap());

class BookModel {
  final String? kind;
  final int? totalItems;
  final List<Item>? items;

  BookModel({
    this.kind,
    this.totalItems,
    this.items,
  });

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: json["volumeInfo"] == null
            ? null
            : VolumeInfo.fromMap(json["volumeInfo"]),
        saleInfo: json["saleInfo"] == null
            ? null
            : SaleInfo.fromMap(json["saleInfo"]),
        accessInfo: json["accessInfo"] == null
            ? null
            : AccessInfo.fromMap(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null
            ? null
            : SearchInfo.fromMap(json["searchInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo?.toMap(),
        "saleInfo": saleInfo?.toMap(),
        "accessInfo": accessInfo?.toMap(),
        "searchInfo": searchInfo?.toMap(),
      };
}

class AccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Epub? pdf;
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

  factory AccessInfo.fromMap(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: json["epub"] == null ? null : Epub.fromMap(json["epub"]),
        pdf: json["pdf"] == null ? null : Epub.fromMap(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub?.toMap(),
        "pdf": pdf?.toMap(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

class Epub {
  final bool? isAvailable;
  final String? acsTokenLink;

  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  factory Epub.fromMap(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink: json["acsTokenLink"],
      );

  Map<String, dynamic> toMap() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink,
      };
}

class SaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final SaleInfoListPrice? listPrice;
  final SaleInfoListPrice? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromMap(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null
            ? null
            : SaleInfoListPrice.fromMap(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : SaleInfoListPrice.fromMap(json["retailPrice"]),
        buyLink: json["buyLink"],
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
        "listPrice": listPrice?.toMap(),
        "retailPrice": retailPrice?.toMap(),
        "buyLink": buyLink,
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toMap())),
      };
}

class SaleInfoListPrice {
  final double? amount;
  final String? currencyCode;

  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  factory SaleInfoListPrice.fromMap(Map<String, dynamic> json) =>
      SaleInfoListPrice(
        amount: json["amount"]?.toDouble(),
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Offer {
  final int? finskyOfferType;
  final OfferListPrice? listPrice;
  final OfferListPrice? retailPrice;

  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  factory Offer.fromMap(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: json["listPrice"] == null
            ? null
            : OfferListPrice.fromMap(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : OfferListPrice.fromMap(json["retailPrice"]),
      );

  Map<String, dynamic> toMap() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice?.toMap(),
        "retailPrice": retailPrice?.toMap(),
      };
}

class OfferListPrice {
  final int? amountInMicros;
  final String? currencyCode;

  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  factory OfferListPrice.fromMap(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toMap() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
      };
}

class SearchInfo {
  final String? textSnippet;

  SearchInfo({
    this.textSnippet,
  });

  factory SearchInfo.fromMap(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toMap() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromMap(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null
            ? []
            : List<String>.from(json["authors"]!.map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null
            ? []
            : List<IndustryIdentifier>.from(json["industryIdentifiers"]!
                .map((x) => IndustryIdentifier.fromMap(x))),
        readingModes: json["readingModes"] == null
            ? null
            : ReadingModes.fromMap(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: json["printType"],
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        averageRating: json["averageRating"]?.toDouble(),
        ratingsCount: json["ratingsCount"],
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null
            ? null
            : PanelizationSummary.fromMap(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null
            ? null
            : ImageLinks.fromMap(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "subtitle": subtitle,
        "authors":
            authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher,
        "publishedDate": publishedDate,
        "description": description,
        "industryIdentifiers": industryIdentifiers == null
            ? []
            : List<dynamic>.from(industryIdentifiers!.map((x) => x.toMap())),
        "readingModes": readingModes?.toMap(),
        "pageCount": pageCount,
        "printType": printType,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary?.toMap(),
        "imageLinks": imageLinks?.toMap(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromMap(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  final String? type;
  final String? identifier;

  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  factory IndustryIdentifier.fromMap(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "identifier": identifier,
      };
}

class PanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromMap(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toMap() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

class ReadingModes {
  final bool? text;
  final bool? image;

  ReadingModes({
    this.text,
    this.image,
  });

  factory ReadingModes.fromMap(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "image": image,
      };
}
