class ModelCountries {
  String flagURL;
  String name;
  String endDate;

  ModelCountries({this.flagURL, this.name, this.endDate});


  String get getFlagURL => flagURL;

  set setFlagURL(String flagURL) => this.flagURL = flagURL;

  String get getName => name;

  set setName(String name) => this.name = name;

  String get getEndDate => endDate;

  set setEndDate(String endDate) => this.endDate = endDate;
}
