// To parse this JSON data, do
//
//     final statesCurrentModel = statesCurrentModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/states_current_entity.dart';

List<StatesCurrentModel> statesCurrentModelFromJson(String str) =>
    List<StatesCurrentModel>.from(
        json.decode(str).map((x) => StatesCurrentModel.fromJson(x)));

String statesCurrentModelToJson(List<StatesCurrentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatesCurrentModel extends StatesCurrentEntity {
  StatesCurrentModel({
    required super.date,
    required super.state,
    required super.positive,
    required super.probableCases,
    required super.negative,
    required super.pending,
    required super.totalTestResultsSource,
    required super.totalTestResults,
    required super.hospitalizedCurrently,
    required super.hospitalizedCumulative,
    required super.inIcuCurrently,
    required super.inIcuCumulative,
    required super.onVentilatorCurrently,
    required super.onVentilatorCumulative,
    required super.recovered,
    required super.lastUpdateEt,
    required super.dateModified,
    required super.checkTimeEt,
    required super.death,
    required super.hospitalized,
    required super.hospitalizedDischarged,
    required super.dateChecked,
    required super.totalTestsViral,
    required super.positiveTestsViral,
    required super.negativeTestsViral,
    required super.positiveCasesViral,
    required super.deathConfirmed,
    required super.deathProbable,
    required super.totalTestEncountersViral,
    required super.totalTestsPeopleViral,
    required super.totalTestsAntibody,
    required super.positiveTestsAntibody,
    required super.negativeTestsAntibody,
    required super.totalTestsPeopleAntibody,
    required super.positiveTestsPeopleAntibody,
    required super.negativeTestsPeopleAntibody,
    required super.totalTestsPeopleAntigen,
    required super.positiveTestsPeopleAntigen,
    required super.totalTestsAntigen,
    required super.positiveTestsAntigen,
    required super.fips,
    required super.positiveIncrease,
    required super.negativeIncrease,
    required super.total,
    required super.totalTestResultsIncrease,
    required super.posNeg,
    required super.dataQualityGrade,
    required super.deathIncrease,
    required super.hospitalizedIncrease,
    required super.hash,
    required super.commercialScore,
    required super.negativeRegularScore,
    required super.negativeScore,
    required super.positiveScore,
    required super.score,
    required super.grade,
  });

  factory StatesCurrentModel.fromJson(Map<String, dynamic> json) =>
      StatesCurrentModel(
        date: json["date"],
        state: json["state"],
        positive: json["positive"],
        probableCases: json["probableCases"],
        negative: json["negative"],
        pending: json["pending"],
        totalTestResultsSource: json["totalTestResultsSource"],
        totalTestResults: json["totalTestResults"],
        hospitalizedCurrently: json["hospitalizedCurrently"],
        hospitalizedCumulative: json["hospitalizedCumulative"],
        inIcuCurrently: json["inIcuCurrently"],
        inIcuCumulative: json["inIcuCumulative"],
        onVentilatorCurrently: json["onVentilatorCurrently"],
        onVentilatorCumulative: json["onVentilatorCumulative"],
        recovered: json["recovered"],
        lastUpdateEt: json["lastUpdateEt"],
        dateModified: DateTime.parse(json["dateModified"]),
        checkTimeEt: json["checkTimeEt"],
        death: json["death"],
        hospitalized: json["hospitalized"],
        hospitalizedDischarged: json["hospitalizedDischarged"],
        dateChecked: DateTime.parse(json["dateChecked"]),
        totalTestsViral: json["totalTestsViral"],
        positiveTestsViral: json["positiveTestsViral"],
        negativeTestsViral: json["negativeTestsViral"],
        positiveCasesViral: json["positiveCasesViral"],
        deathConfirmed: json["deathConfirmed"],
        deathProbable: json["deathProbable"],
        totalTestEncountersViral: json["totalTestEncountersViral"],
        totalTestsPeopleViral: json["totalTestsPeopleViral"],
        totalTestsAntibody: json["totalTestsAntibody"],
        positiveTestsAntibody: json["positiveTestsAntibody"],
        negativeTestsAntibody: json["negativeTestsAntibody"],
        totalTestsPeopleAntibody: json["totalTestsPeopleAntibody"],
        positiveTestsPeopleAntibody: json["positiveTestsPeopleAntibody"],
        negativeTestsPeopleAntibody: json["negativeTestsPeopleAntibody"],
        totalTestsPeopleAntigen: json["totalTestsPeopleAntigen"],
        positiveTestsPeopleAntigen: json["positiveTestsPeopleAntigen"],
        totalTestsAntigen: json["totalTestsAntigen"],
        positiveTestsAntigen: json["positiveTestsAntigen"],
        fips: json["fips"],
        positiveIncrease: json["positiveIncrease"],
        negativeIncrease: json["negativeIncrease"],
        total: json["total"],
        totalTestResultsIncrease: json["totalTestResultsIncrease"],
        posNeg: json["posNeg"],
        dataQualityGrade: json["dataQualityGrade"],
        deathIncrease: json["deathIncrease"],
        hospitalizedIncrease: json["hospitalizedIncrease"],
        hash: json["hash"],
        commercialScore: json["commercialScore"],
        negativeRegularScore: json["negativeRegularScore"],
        negativeScore: json["negativeScore"],
        positiveScore: json["positiveScore"],
        score: json["score"],
        grade: json["grade"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "state": state,
        "positive": positive,
        "probableCases": probableCases,
        "negative": negative,
        "pending": pending,
        "totalTestResultsSource": totalTestResultsSource,
        "totalTestResults": totalTestResults,
        "hospitalizedCurrently": hospitalizedCurrently,
        "hospitalizedCumulative": hospitalizedCumulative,
        "inIcuCurrently": inIcuCurrently,
        "inIcuCumulative": inIcuCumulative,
        "onVentilatorCurrently": onVentilatorCurrently,
        "onVentilatorCumulative": onVentilatorCumulative,
        "recovered": recovered,
        "lastUpdateEt": lastUpdateEt,
        "dateModified": dateModified.toIso8601String(),
        "checkTimeEt": checkTimeEt,
        "death": death,
        "hospitalized": hospitalized,
        "hospitalizedDischarged": hospitalizedDischarged,
        "dateChecked": dateChecked.toIso8601String(),
        "totalTestsViral": totalTestsViral,
        "positiveTestsViral": positiveTestsViral,
        "negativeTestsViral": negativeTestsViral,
        "positiveCasesViral": positiveCasesViral,
        "deathConfirmed": deathConfirmed,
        "deathProbable": deathProbable,
        "totalTestEncountersViral": totalTestEncountersViral,
        "totalTestsPeopleViral": totalTestsPeopleViral,
        "totalTestsAntibody": totalTestsAntibody,
        "positiveTestsAntibody": positiveTestsAntibody,
        "negativeTestsAntibody": negativeTestsAntibody,
        "totalTestsPeopleAntibody": totalTestsPeopleAntibody,
        "positiveTestsPeopleAntibody": positiveTestsPeopleAntibody,
        "negativeTestsPeopleAntibody": negativeTestsPeopleAntibody,
        "totalTestsPeopleAntigen": totalTestsPeopleAntigen,
        "positiveTestsPeopleAntigen": positiveTestsPeopleAntigen,
        "totalTestsAntigen": totalTestsAntigen,
        "positiveTestsAntigen": positiveTestsAntigen,
        "fips": fips,
        "positiveIncrease": positiveIncrease,
        "negativeIncrease": negativeIncrease,
        "total": total,
        "totalTestResultsIncrease": totalTestResultsIncrease,
        "posNeg": posNeg,
        "dataQualityGrade": dataQualityGrade,
        "deathIncrease": deathIncrease,
        "hospitalizedIncrease": hospitalizedIncrease,
        "hash": hash,
        "commercialScore": commercialScore,
        "negativeRegularScore": negativeRegularScore,
        "negativeScore": negativeScore,
        "positiveScore": positiveScore,
        "score": score,
        "grade": grade,
      };
}
