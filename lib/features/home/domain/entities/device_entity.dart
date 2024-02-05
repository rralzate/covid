class DeviceEntity {
  final int date;
  final int states;
  final int positive;
  final int negative;
  final int pending;
  final int hospitalizedCurrently;
  final int hospitalizedCumulative;
  final int inIcuCurrently;
  final int inIcuCumulative;
  final int onVentilatorCurrently;
  final int onVentilatorCumulative;
  final String dateChecked;
  final int death;
  final int hospitalized;
  final int totalTestResults;
  final String lastModified;
  final dynamic recovered;
  final int total;
  final int posNeg;
  final int deathIncrease;
  final int hospitalizedIncrease;
  final int negativeIncrease;
  final int positiveIncrease;
  final int totalTestResultsIncrease;
  final String hash;

  DeviceEntity({
    required this.date,
    required this.states,
    required this.positive,
    required this.negative,
    required this.pending,
    required this.hospitalizedCurrently,
    required this.hospitalizedCumulative,
    required this.inIcuCurrently,
    required this.inIcuCumulative,
    required this.onVentilatorCurrently,
    required this.onVentilatorCumulative,
    required this.dateChecked,
    required this.death,
    required this.hospitalized,
    required this.totalTestResults,
    required this.lastModified,
    required this.recovered,
    required this.total,
    required this.posNeg,
    required this.deathIncrease,
    required this.hospitalizedIncrease,
    required this.negativeIncrease,
    required this.positiveIncrease,
    required this.totalTestResultsIncrease,
    required this.hash,
  });

  DeviceEntity.empty()
      : date = 0,
        states = 0,
        positive = 0,
        negative = 0,
        pending = 0,
        hospitalizedCurrently = 0,
        hospitalizedCumulative = 0,
        inIcuCurrently = 0,
        inIcuCumulative = 0,
        onVentilatorCurrently = 0,
        onVentilatorCumulative = 0,
        dateChecked = '',
        death = 0,
        hospitalized = 0,
        totalTestResults = 0,
        lastModified = '',
        recovered = 0,
        total = 0,
        posNeg = 0,
        deathIncrease = 0,
        hospitalizedIncrease = 0,
        negativeIncrease = 0,
        positiveIncrease = 0,
        totalTestResultsIncrease = 0,
        hash = '';
}
