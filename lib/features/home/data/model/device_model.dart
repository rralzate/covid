import 'dart:convert';

import 'package:covid/features/home/domain/entities/device_entity.dart';

class DeviceModel extends DeviceEntity {
  DeviceModel({
    required super.date,
    required super.states,
    required super.positive,
    required super.negative,
    required super.pending,
    required super.hospitalizedCurrently,
    required super.hospitalizedCumulative,
    required super.inIcuCurrently,
    required super.inIcuCumulative,
    required super.onVentilatorCurrently,
    required super.onVentilatorCumulative,
    required super.dateChecked,
    required super.death,
    required super.hospitalized,
    required super.totalTestResults,
    required super.lastModified,
    required super.recovered,
    required super.total,
    required super.posNeg,
    required super.deathIncrease,
    required super.hospitalizedIncrease,
    required super.negativeIncrease,
    required super.positiveIncrease,
    required super.totalTestResultsIncrease,
    required super.hash,
  });

  List<DeviceModel> deviceModelFromJson(String str) => List<DeviceModel>.from(
      json.decode(str).map((x) => DeviceModel.fromJson(x)));

  String deviceModelToJson(List<DeviceModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
        date: json["date"],
        states: json["states"],
        positive: json["positive"],
        negative: json["negative"],
        pending: json["pending"],
        hospitalizedCurrently: json["hospitalizedCurrently"],
        hospitalizedCumulative: json["hospitalizedCumulative"],
        inIcuCurrently: json["inIcuCurrently"],
        inIcuCumulative: json["inIcuCumulative"],
        onVentilatorCurrently: json["onVentilatorCurrently"],
        onVentilatorCumulative: json["onVentilatorCumulative"],
        dateChecked: json["dateChecked"],
        death: json["death"],
        hospitalized: json["hospitalized"],
        totalTestResults: json["totalTestResults"],
        lastModified: json["lastModified"],
        recovered: json["recovered"],
        total: json["total"],
        posNeg: json["posNeg"],
        deathIncrease: json["deathIncrease"],
        hospitalizedIncrease: json["hospitalizedIncrease"],
        negativeIncrease: json["negativeIncrease"],
        positiveIncrease: json["positiveIncrease"],
        totalTestResultsIncrease: json["totalTestResultsIncrease"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "states": states,
        "positive": positive,
        "negative": negative,
        "pending": pending,
        "hospitalizedCurrently": hospitalizedCurrently,
        "hospitalizedCumulative": hospitalizedCumulative,
        "inIcuCurrently": inIcuCurrently,
        "inIcuCumulative": inIcuCumulative,
        "onVentilatorCurrently": onVentilatorCurrently,
        "onVentilatorCumulative": onVentilatorCumulative,
        "dateChecked": dateChecked,
        "death": death,
        "hospitalized": hospitalized,
        "totalTestResults": totalTestResults,
        "lastModified": lastModified,
        "recovered": recovered,
        "total": total,
        "posNeg": posNeg,
        "deathIncrease": deathIncrease,
        "hospitalizedIncrease": hospitalizedIncrease,
        "negativeIncrease": negativeIncrease,
        "positiveIncrease": positiveIncrease,
        "totalTestResultsIncrease": totalTestResultsIncrease,
        "hash": hash,
      };
}
