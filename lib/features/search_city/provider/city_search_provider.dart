import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather/common/provider/dio/dio_provider.dart';
import 'package:riverpod_weather/features/search_city/data/model/city_search_result.dart';
import 'package:riverpod_weather/features/search_city/data/model/service/city_search_service.dart';
import 'package:riverpod_weather/features/search_city/provider/state/city_search_state.dart';
import 'package:dio/dio.dart';

class CitySearchProvider extends Notifier{
  CitySearchState citySearchState = CitySearchLoading();
  @override
  build() {
    return CitySearchState;
  }
  late final Dio _dio=ref.read(dioProvider);
  late final CitySearchService _citySearchService = CitySearchService(_dio);
  void citySearch(String name)async{
    citySearchState = CitySearchLoading();
   CitySearchResult citySearchResult =await _citySearchService.citySearch(name: name, count: 10, language: "eng", format: "json");
  }

}