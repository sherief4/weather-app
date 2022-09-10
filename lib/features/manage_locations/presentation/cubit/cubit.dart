import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/manage_locations/data/search_result_model.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/states.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit({required this.sharedPreferences})
      : super(LocationInitialState());
  final SharedPreferences sharedPreferences;

  static LocationCubit get(BuildContext context) => BlocProvider.of(context);
  late SearchResultModel searchResultModel;

  Future<void> getSearchData({required String city}) async {
    emit(GetSearchDataLoadingState());
    await http
        .get(Uri.parse(
            'https://api.weatherapi.com/v1/current.json?key=57b2b6429a95411288f101612220609&q=$city'))
        .then((response) {
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        searchResultModel = SearchResultModel.fromJson(decodedJson);
        emit(GetSearchDataSuccessState(searchResult: searchResultModel));
      } else {
        emit(GetSearchDataErrorState(error: 'Error 404 '));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetSearchDataErrorState(error: error.toString()));
    });
  }

  Future<void> chooseLocation({required String city}) async {
    await getSearchData(city: city).then((value) {
      emit(GetSearchDataSuccessState(searchResult: searchResultModel));
    }).catchError((error) {
      emit(GetSearchDataErrorState(error: error.toString()));
    });
  }

  List<String> favouriteLocations = [];

  void getFavouriteLocations() {
    favouriteLocations = sharedPreferences.getStringList('favourites') ?? [];
    emit(GetFavouriteLocationsSuccessState());
  }

  addCityToFavourite({required String city}) {
    favouriteLocations.add(city);
    sharedPreferences.setStringList('favourites', favouriteLocations);
    emit(AddCityToFavouriteSuccessState());
  }

  void removeCityFromFavourites({required int index}) async {
    favouriteLocations.removeAt(index);
    sharedPreferences.setStringList('favourites', favouriteLocations);
    emit(RemoveCityFromFavouritesSuccessState());
  }
}
