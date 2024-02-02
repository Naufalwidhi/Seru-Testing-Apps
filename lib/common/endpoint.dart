import 'package:seru_testing_app/common/http_client.dart';

class Endpoint {
  final String baseURL;
  final String apiKey = "Get API KEY di BinderByte";

  Endpoint({
    required this.baseURL,
  });

  Uri province() {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/wilayah/provinsi",
      queryParameters: {
        "api_key": apiKey,
      },
    );
  }

  Uri city(String provinceID) {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/wilayah/kabupaten",
      queryParameters: {
        "api_key": apiKey,
        "id_provinsi": provinceID,
      },
    );
  }

  Uri district(String cityID) {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/wilayah/kecamatan",
      queryParameters: {
        "api_key": apiKey,
        "id_kabupaten": cityID,
      },
    );
  }

  Uri area(String districtID) {
    return UriHelper.createUrl(
      host: baseURL,
      path: "/wilayah/kelurahan",
      queryParameters: {
        "api_key": apiKey,
        "id_kecamatan": districtID,
      },
    );
  }

  factory Endpoint.getRegion() {
    return Endpoint(
      baseURL: "api.binderbyte.com",
    );
  }
}
