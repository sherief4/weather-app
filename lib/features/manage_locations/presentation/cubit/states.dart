import 'package:weather_app/features/manage_locations/data/search_result_model.dart';

abstract class LocationStates {}
class LocationInitialState extends LocationStates{}

class GetSearchDataSuccessState extends LocationStates {
  GetSearchDataSuccessState({required this.searchResult});
  final SearchResultModel searchResult;
}

class GetSearchDataLoadingState extends LocationStates {}

class GetSearchDataErrorState extends LocationStates {
  GetSearchDataErrorState({required this.error});

  final String error;
}

class AddCityToFavouriteSuccessState extends LocationStates {}

class GetFavouriteLocationsSuccessState extends LocationStates {}

class RemoveCityFromFavouritesSuccessState extends LocationStates {}

class ChooseLocationSuccessState extends LocationStates {}
