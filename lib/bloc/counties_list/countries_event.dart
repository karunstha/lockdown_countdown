part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable {
  const CountriesEvent();
}

class EventListCountries extends CountriesEvent {
  @override
  List<Object> get props => null;
}

class EventSearchCountries extends CountriesEvent {
  final String query;
  EventSearchCountries(this.query);
  @override
  List<Object> get props => null;
}
