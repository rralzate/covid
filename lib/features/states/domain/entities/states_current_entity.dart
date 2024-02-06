class StatesCurrentEntity {
  final int date;
  final String state;
  final int positive;
  final int probableCases;
  final int negative;
  final int pending;
  final String totalTestResultsSource;
  final int totalTestResults;
  final int hospitalizedCurrently;
  final int hospitalizedCumulative;
  final int inIcuCurrently;
  final int inIcuCumulative;
  final int onVentilatorCurrently;
  final int onVentilatorCumulative;
  final int recovered;
  final String lastUpdateEt;
  final DateTime dateModified;
  final String checkTimeEt;
  final int death;
  final int hospitalized;
  final int hospitalizedDischarged;
  final DateTime dateChecked;
  final int totalTestsViral;
  final int positiveTestsViral;
  final int negativeTestsViral;
  final int positiveCasesViral;
  final int deathConfirmed;
  final int deathProbable;
  final int totalTestEncountersViral;
  final int totalTestsPeopleViral;
  final int totalTestsAntibody;
  final int positiveTestsAntibody;
  final int negativeTestsAntibody;
  final int totalTestsPeopleAntibody;
  final int positiveTestsPeopleAntibody;
  final int negativeTestsPeopleAntibody;
  final int totalTestsPeopleAntigen;
  final int positiveTestsPeopleAntigen;
  final int totalTestsAntigen;
  final int positiveTestsAntigen;
  final String fips;
  final int positiveIncrease;
  final int negativeIncrease;
  final int total;
  final int totalTestResultsIncrease;
  final int posNeg;
  final dynamic dataQualityGrade;
  final int deathIncrease;
  final int hospitalizedIncrease;
  final String hash;
  final int commercialScore;
  final int negativeRegularScore;
  final int negativeScore;
  final int positiveScore;
  final int score;
  final String grade;

  StatesCurrentEntity({
    required this.date,
    required this.state,
    required this.positive,
    required this.probableCases,
    required this.negative,
    required this.pending,
    required this.totalTestResultsSource,
    required this.totalTestResults,
    required this.hospitalizedCurrently,
    required this.hospitalizedCumulative,
    required this.inIcuCurrently,
    required this.inIcuCumulative,
    required this.onVentilatorCurrently,
    required this.onVentilatorCumulative,
    required this.recovered,
    required this.lastUpdateEt,
    required this.dateModified,
    required this.checkTimeEt,
    required this.death,
    required this.hospitalized,
    required this.hospitalizedDischarged,
    required this.dateChecked,
    required this.totalTestsViral,
    required this.positiveTestsViral,
    required this.negativeTestsViral,
    required this.positiveCasesViral,
    required this.deathConfirmed,
    required this.deathProbable,
    required this.totalTestEncountersViral,
    required this.totalTestsPeopleViral,
    required this.totalTestsAntibody,
    required this.positiveTestsAntibody,
    required this.negativeTestsAntibody,
    required this.totalTestsPeopleAntibody,
    required this.positiveTestsPeopleAntibody,
    required this.negativeTestsPeopleAntibody,
    required this.totalTestsPeopleAntigen,
    required this.positiveTestsPeopleAntigen,
    required this.totalTestsAntigen,
    required this.positiveTestsAntigen,
    required this.fips,
    required this.positiveIncrease,
    required this.negativeIncrease,
    required this.total,
    required this.totalTestResultsIncrease,
    required this.posNeg,
    required this.dataQualityGrade,
    required this.deathIncrease,
    required this.hospitalizedIncrease,
    required this.hash,
    required this.commercialScore,
    required this.negativeRegularScore,
    required this.negativeScore,
    required this.positiveScore,
    required this.score,
    required this.grade,
  });
}
