class RegionDetailEntity {
  final String? state;
  final String? notes;
  final String? covid19Site;
  final String? covid19SiteSecondary;
  final String? covid19SiteTertiary;
  final dynamic covid19SiteQuaternary;
  final dynamic covid19SiteQuinary;
  final String? twitter;
  final String? covid19SiteOld;
  final String? covidTrackingProjectPreferredTotalTestUnits;
  final String? covidTrackingProjectPreferredTotalTestField;
  final String? totalTestResultsField;
  final String? pui;
  final bool? pum;
  final String? name;
  final String? fips;

  const RegionDetailEntity.empty()
      : state = '',
        notes = '',
        covid19Site = '',
        covid19SiteSecondary = '',
        covid19SiteTertiary = '',
        covid19SiteQuaternary = '',
        covid19SiteQuinary = '',
        twitter = '',
        covid19SiteOld = '',
        covidTrackingProjectPreferredTotalTestUnits = '',
        covidTrackingProjectPreferredTotalTestField = '',
        totalTestResultsField = '',
        pui = '',
        pum = false,
        name = '',
        fips = '';

  RegionDetailEntity({
    this.state,
    this.notes,
    this.covid19Site,
    this.covid19SiteSecondary,
    this.covid19SiteTertiary,
    this.covid19SiteQuaternary,
    this.covid19SiteQuinary,
    this.twitter,
    this.covid19SiteOld,
    this.covidTrackingProjectPreferredTotalTestUnits,
    this.covidTrackingProjectPreferredTotalTestField,
    this.totalTestResultsField,
    this.pui,
    this.pum,
    this.name,
    this.fips,
  });
}
