
import 'package:seru_testing_app/model/province_model.dart';
import 'package:seru_testing_app/services/region_services.dart';

abstract class RegionRepositoryAbstract {
  Future<ProvinceModel> province();
}

class RegionRepository implements RegionRepositoryAbstract {
  final RegionServiceAbstract regionService;

  RegionRepository({
    required this.regionService,
  });

  Future<ProvinceModel> province() async {
    return await regionService.province();
  }

  factory RegionRepository.create() {
    return RegionRepository(
      regionService: RegionService.create(),
    );
  }
}
