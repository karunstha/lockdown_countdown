import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lockdowncountdown/model_countries.dart';
import 'package:firebase_database/firebase_database.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  @override
  CountriesState get initialState => StateCountriesInitial();

  final db = FirebaseDatabase.instance.reference();

  List<ModelCountries> countriesList = new List<ModelCountries>();
  List<ModelCountries> queryCountryList = new List<ModelCountries>();

  @override
  Stream<CountriesState> mapEventToState(
    CountriesEvent event,
  ) async* {
    if (event is EventListCountries) {
      yield StateCountriesLoading();
      await fetchCountries();
      yield StateCountriesLoaded(countriesList);
    } else if (event is EventSearchCountries) {
      yield StateCountriesSearchStarted();
      searchList(event.query);
      yield StateCountriesLoaded(queryCountryList);
    }
  }

  Future fetchCountries() async {
    await db.child('countries').once().then((DataSnapshot data) {
      Map aa = data.value;
      List item = [];
      aa.forEach((index, data) => item.add({
            "key": index,
            "flagURL": data['flagURL'],
            "endDate": data['endDate']
          }));
      item.forEach((f) => countriesList.add(ModelCountries(
          name: f['key'], flagURL: f['flagURL'], endDate: f['endDate'])));
      print(item.toString());
    });
  }

  void searchList(String query) {
    queryCountryList.clear();
    for (int i = 0; i < countriesList.length; i++) {
      if (countriesList[i]
          .getName
          .toLowerCase()
          .contains(query.toLowerCase())) {
        queryCountryList.add(countriesList[i]);
      }
    }
  }
}
