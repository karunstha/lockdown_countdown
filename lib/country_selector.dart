import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counties_list/countries_bloc.dart';
import 'model_countries.dart';

class CountrySelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CountrySelectorState();
  }
}

class CountrySelectorState extends State<CountrySelector> {
  CountriesBloc countriesBloc = CountriesBloc();

  @override
  void initState() {
    super.initState();
    countriesBloc.add(EventListCountries());
  }

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Select your country",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      controller: searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        countriesBloc.add(EventSearchCountries(value));
                      },
                      onChanged: (String value) {
                        countriesBloc.add(EventSearchCountries(value));
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Container(
                            transform:
                                Matrix4.translationValues(-10.0, 0.0, 0.0),
                            child: Icon(Icons.search)),
                      ),
                    ),
                    BlocProvider<CountriesBloc>(
                      create: (_) => countriesBloc,
                      child: BlocBuilder<CountriesBloc, CountriesState>(
                          builder: (BuildContext context, state) {
                        if (state is StateCountriesLoaded) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: state.countriesList.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Container(
                                    child: Row(children: <Widget>[
                                  Image.network(
                                    state.countriesList[i].getFlagURL,
                                    height: 40,
                                    width: 60,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: 24.0,
                                  ),
                                  Text(
                                    state.countriesList[i].getName,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  )
                                ])),
                              );
                            },
                          );
                        } else {
                          return Container(
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.orangeAccent),
                            ),
                          );
                        }
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
