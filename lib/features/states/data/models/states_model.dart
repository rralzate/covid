// To parse this JSON data, do
//
//     final statesModel = statesModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/states_entity.dart';

List<StatesModel> statesModelFromJson(String str) => List<StatesModel>.from(
    json.decode(str).map((x) => StatesModel.fromJson(x)));

String statesModelToJson(List<StatesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatesModel extends StatesEntity {
  StatesModel({
    required super.state,
    required super.notes,
    super.covid19Site,
    super.covid19SiteSecondary,
    super.covid19SiteTertiary,
    super.covid19SiteQuaternary,
    super.covid19SiteQuinary,
    super.twitter,
    required super.covid19SiteOld,
    required super.covidTrackingProjectPreferredTotalTestUnits,
    required super.covidTrackingProjectPreferredTotalTestField,
    required super.totalTestResultsField,
    required super.pui,
    required super.pum,
    required super.name,
    required super.fips,
  });

  factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
        state: json["state"],
        notes: json["notes"],
        covid19Site: json["covid19Site"] ?? '',
        covid19SiteSecondary: json["covid19SiteSecondary"] ?? '',
        covid19SiteTertiary: json["covid19SiteTertiary"] ?? '',
        covid19SiteQuaternary: json["covid19SiteQuaternary"] ?? '',
        covid19SiteQuinary: json["covid19SiteQuinary"] ?? '',
        twitter: json["twitter"] ?? '',
        covid19SiteOld: json["covid19SiteOld"],
        covidTrackingProjectPreferredTotalTestUnits:
            json["covidTrackingProjectPreferredTotalTestUnits"],
        covidTrackingProjectPreferredTotalTestField:
            json["covidTrackingProjectPreferredTotalTestField"],
        totalTestResultsField: json["totalTestResultsField"],
        pui: json["pui"],
        pum: json["pum"],
        name: json["name"],
        fips: json["fips"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "notes": notes,
        "covid19Site": covid19Site,
        "covid19SiteSecondary": covid19SiteSecondary,
        "covid19SiteTertiary": covid19SiteTertiary,
        "covid19SiteQuaternary": covid19SiteQuaternary,
        "covid19SiteQuinary": covid19SiteQuinary,
        "twitter": twitter,
        "covid19SiteOld": covid19SiteOld,
        "covidTrackingProjectPreferredTotalTestUnits":
            covidTrackingProjectPreferredTotalTestUnits,
        "covidTrackingProjectPreferredTotalTestField":
            covidTrackingProjectPreferredTotalTestField,
        "totalTestResultsField": totalTestResultsField,
        "pui": pui,
        "pum": pum,
        "name": name,
        "fips": fips,
      };
}
