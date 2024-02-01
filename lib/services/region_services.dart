import 'package:seru_testing_app/common/endpoint.dart';
import 'package:seru_testing_app/common/http_client.dart';
import 'package:seru_testing_app/helper/exception.dart';
import 'package:seru_testing_app/helper/exception_handling.dart';
import 'package:seru_testing_app/model/area_model.dart';
import 'package:seru_testing_app/model/city_model.dart';
import 'package:seru_testing_app/model/district_model.dart';
import 'package:seru_testing_app/model/province_model.dart';

abstract class RegionServiceAbstract {
  Future<ProvinceModel> province();
  Future<CityModel> city(String provinceID);
  Future<DistrictModel> district(String cityID);
  Future<AreaModel> area(String districtID);
}

class RegionService implements RegionServiceAbstract {
  final HttpClient httpClient;
  final Endpoint endpoint;

  RegionService({
    required this.httpClient,
    required this.endpoint,
  });

  @override
  Future<ProvinceModel> province() async {
    try {
      final url = endpoint.province();
      final response = await httpClient.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return ProvinceModel.fromJson(response.body);
    } on AppException {
      rethrow;
    } catch (exception) {
      throw UnknownException(message: exception.toString());
    }
  }

  @override
  Future<CityModel> city(String provinceID) async {
    try {
      final url = endpoint.city(provinceID);
      final response = await httpClient.get(
        url,
        null,
      );
      print(response.body);
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return CityModel.fromJson(response.body);
    } on AppException {
      rethrow;
    } catch (exception) {
      throw UnknownException(message: exception.toString());
    }
  }

  @override
  Future<DistrictModel> district(String cityID) async {
    try {
      final url = endpoint.district(cityID);
      final response = await httpClient.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return DistrictModel.fromJson(response.body);
    } on AppException {
      rethrow;
    } catch (exception) {
      throw UnknownException(message: exception.toString());
    }
  }

  @override
  Future<AreaModel> area(String districtID) async {
    try {
      final url = endpoint.area(districtID);
      final response = await httpClient.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return AreaModel.fromJson(response.body);
    } on AppException {
      rethrow;
    } catch (exception) {
      throw UnknownException(message: exception.toString());
    }
  }

  factory RegionService.create() {
    return RegionService(
      httpClient: CoinsleekHttpClient.create(),
      endpoint: Endpoint.getRegion(),
    );
  }
}
