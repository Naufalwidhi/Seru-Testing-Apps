import 'package:seru_testing_app/model/area_model.dart';
import 'package:seru_testing_app/model/city_model.dart';
import 'package:seru_testing_app/model/district_model.dart';
import 'package:seru_testing_app/model/province_model.dart';
import 'package:seru_testing_app/services/region_services.dart';

abstract class RegionRepositoryAbstract {
  Future<ProvinceModel> province();
  Future<CityModel> city(String provinceID);
  Future<DistrictModel> district(String cityID);
  Future<AreaModel> area(String areaID);
}

class RegionRepository implements RegionRepositoryAbstract {
  final RegionServiceAbstract regionService;

  RegionRepository({
    required this.regionService,
  });

  Future<ProvinceModel> province() async {
    return await regionService.province();
  }

  Future<CityModel> city(String provinceID) async {
    return await regionService.city(provinceID);
  }
  Future<DistrictModel> district(String cityID) async {
    return await regionService.district(cityID);
  }
  Future<AreaModel> area(String areaID) async {
    return await regionService.area(areaID);
  }

  factory RegionRepository.create() {
    return RegionRepository(
      regionService: RegionService.create(),
    );
  }
}
