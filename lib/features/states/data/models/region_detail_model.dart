import 'dart:convert';

import 'package:covid/features/states/domain/entities/region_detail_entity.dart';

class RegionDetailModel extends RegionDetailEntity {
  RegionDetailModel({
    super.state,
    super.notes,
    super.covid19Site,
    super.covid19SiteSecondary,
    super.covid19SiteTertiary,
    super.covid19SiteQuaternary,
    super.covid19SiteQuinary,
    super.twitter,
    super.covid19SiteOld,
    super.covidTrackingProjectPreferredTotalTestUnits,
    super.covidTrackingProjectPreferredTotalTestField,
    super.totalTestResultsField,
    super.pui,
    super.pum,
    super.name,
    super.fips,
  });

  factory RegionDetailModel.regionDetailModelFromJson(String str) =>
      RegionDetailModel.fromJson(json.decode(str));

  String regionDetailModelToJson(RegionDetailModel data) =>
      json.encode(data.toJson());

  factory RegionDetailModel.fromJson(Map<String, dynamic> json) =>
      RegionDetailModel(
        state: json["state"] ?? '',
        notes: json["notes"] ?? '',
        covid19Site: json["covid19Site"] ?? '',
        covid19SiteSecondary: json["covid19SiteSecondary"] ?? '',
        covid19SiteTertiary: json["covid19SiteTertiary"] ?? '',
        covid19SiteQuaternary: json["covid19SiteQuaternary"] ?? '',
        covid19SiteQuinary: json["covid19SiteQuinary"] ?? '',
        twitter: json["twitter"] ?? '',
        covid19SiteOld: json["covid19SiteOld"] ?? '',
        covidTrackingProjectPreferredTotalTestUnits:
            json["covidTrackingProjectPreferredTotalTestUnits"] ?? '',
        covidTrackingProjectPreferredTotalTestField:
            json["covidTrackingProjectPreferredTotalTestField"] ?? '',
        totalTestResultsField: json["totalTestResultsField"] ?? '',
        pui: json["pui"] ?? '',
        pum: json["pum"] ?? false,
        name: json["name"] ?? '',
        fips: json["fips"] ?? '',
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
