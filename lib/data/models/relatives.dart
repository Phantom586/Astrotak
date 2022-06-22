// ignore_for_file: unnecessary_this

class Relatives {
  List<AllRelatives>? allRelatives;

  Relatives({this.allRelatives});

  Relatives.fromJson(Map<String, dynamic> json) {
    if (json['allRelatives'] != null) {
      allRelatives = <AllRelatives>[];
      json['allRelatives'].forEach((v) {
        allRelatives!.add(AllRelatives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.allRelatives != null) {
      data['allRelatives'] = this.allRelatives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllRelatives {
  String? uuid;
  int? relationId;
  String? relation;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? gender;
  String? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  AllRelatives(
      {this.uuid,
      this.relationId,
      this.relation,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.gender,
      this.dateAndTimeOfBirth,
      this.birthDetails,
      this.birthPlace});

  AllRelatives.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    relationId = json['relationId'];
    relation = json['relation'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateAndTimeOfBirth = json['dateAndTimeOfBirth'];
    birthDetails = json['birthDetails'] != null
        ? BirthDetails.fromJson(json['birthDetails'])
        : null;
    birthPlace = json['birthPlace'] != null
        ? BirthPlace.fromJson(json['birthPlace'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = this.uuid;
    data['relationId'] = this.relationId;
    data['relation'] = this.relation;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['dateAndTimeOfBirth'] = this.dateAndTimeOfBirth;
    if (this.birthDetails != null) {
      data['birthDetails'] = this.birthDetails!.toJson();
    }
    if (this.birthPlace != null) {
      data['birthPlace'] = this.birthPlace!.toJson();
    }
    return data;
  }
}

class BirthDetails {
  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  String? meridiem;
  int? tobMin;

  BirthDetails(
      {this.dobYear,
      this.dobMonth,
      this.dobDay,
      this.tobHour,
      this.meridiem,
      this.tobMin});

  BirthDetails.fromJson(Map<String, dynamic> json) {
    dobYear = json['dobYear'];
    dobMonth = json['dobMonth'];
    dobDay = json['dobDay'];
    tobHour = json['tobHour'];
    meridiem = json['meridiem'];
    tobMin = json['tobMin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dobYear'] = this.dobYear;
    data['dobMonth'] = this.dobMonth;
    data['dobDay'] = this.dobDay;
    data['tobHour'] = this.tobHour;
    data['meridiem'] = this.meridiem;
    data['tobMin'] = this.tobMin;
    return data;
  }
}

class BirthPlace {
  String? placeName;
  String? placeId;

  BirthPlace({this.placeName, this.placeId});

  BirthPlace.fromJson(Map<String, dynamic> json) {
    placeName = json['placeName'];
    placeId = json['placeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['placeName'] = this.placeName;
    data['placeId'] = this.placeId;
    return data;
  }
}
