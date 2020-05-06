part of 'countries_bloc.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();
}

class StateCountriesInitial extends CountriesState {
  @override
  List<Object> get props => [];
}

class StateCountriesLoading extends CountriesState {
  @override
  List<Object> get props => null;
}

class StateCountriesLoaded extends CountriesState {
  final List<ModelCountries> countriesList;
  StateCountriesLoaded(this.countriesList);

  @override
  List<Object> get props => null;
}

class StateCountriesSearchStarted extends CountriesState {
  @override
  List<Object> get props => null;
}