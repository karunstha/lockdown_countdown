import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockdowncountdown/homepage.dart';

import 'bloc/counties_list/countries_bloc.dart';
import 'model_countries.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  saveCountryName(String country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('countryName', country);
    Navigator.popAndPushNamed(context, '/');
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Select your country",
                      style: TextStyle(
                          fontSize: 24.0,
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
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: 30),
                              scrollDirection: Axis.vertical,
                              itemCount: state.countriesList.length,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () => [
                                    saveCountryName(
                                        state.countriesList[i].getName)
                                  ],
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                                  ),
                                );
                              },
                            ),
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
