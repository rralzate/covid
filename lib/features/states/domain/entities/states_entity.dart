class StatesEntity {
  final String state;
  final String notes;
  final String? covid19Site;
  final String? covid19SiteSecondary;
  final String? covid19SiteTertiary;
  final String? covid19SiteQuaternary;
  final String? covid19SiteQuinary;
  final String? twitter;
  final String covid19SiteOld;
  final String covidTrackingProjectPreferredTotalTestUnits;
  final String covidTrackingProjectPreferredTotalTestField;
  final String totalTestResultsField;
  final String pui;
  final bool pum;
  final String name;
  final String fips;

  StatesEntity({
    required this.state,
    required this.notes,
    this.covid19Site,
    this.covid19SiteSecondary,
    this.covid19SiteTertiary,
    this.covid19SiteQuaternary,
    this.covid19SiteQuinary,
    this.twitter,
    required this.covid19SiteOld,
    required this.covidTrackingProjectPreferredTotalTestUnits,
    required this.covidTrackingProjectPreferredTotalTestField,
    required this.totalTestResultsField,
    required this.pui,
    required this.pum,
    required this.name,
    required this.fips,
  });
}
