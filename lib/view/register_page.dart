import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seru_testing_app/logic/region_cubit.dart';
import 'package:seru_testing_app/model/province_model.dart';
import 'package:seru_testing_app/services/region_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController date = TextEditingController();
  Map<String, int> monthMap = {
    'Januari': 1,
    'Februari': 2,
    'Maret': 3,
    'April': 4,
    'Mei': 5,
    'Juni': 6,
    'Juli': 7,
    'Agustus': 8,
    'September': 9,
    'Oktober': 10,
    'November': 11,
    'Desember': 12,
  };

  @override
  Widget build(BuildContext context) {
    ProvinceData? selectedProvince;
    // CitiesData? selectedCities;
    // DistrictData? selectedDistrict;
    // AreaData? selectedArea;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProvinceCubit(
            regionRepository: RegionRepository.create(),
          )..getProvince(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  "REGISTER",
                  style: GoogleFonts.rubik(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onTapOutside: (event) {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  maxLines: 1,
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  onTapOutside: (event) {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  maxLines: 1,
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // BlocBuilder<ProvinceCubit, ProvinceState>(
                //   builder: (context, state) {
                //     return DropdownButtonFormField(
                //       hint: Text(
                //         "Pilih Provinsi",
                //         style: GoogleFonts.rubik(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //       value: selectedProvince,
                //       items: state.model?.data
                //           .map(
                //             (e) => DropdownMenuItem(
                //               value: e,
                //               child: Text(
                //                 e.name,
                //                 style: GoogleFonts.rubik(
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ),
                //           )
                //           .toList(),
                //       onChanged: (value) {
                //         setState(() {
                //           context.read<CitiesCubit>().getCities(value!.id);
                //           if (selectedProvince == null)
                //             selectedProvince = value;

                //           if (selectedProvince != null) {
                //             selectedCities = null;
                //             selectedDistrict = null;
                //             selectedArea = null;
                //             selectedProvince = value;
                //           }
                //         });
                //       },
                //       icon: Icon(
                //         Icons.arrow_drop_down,
                //         color: secondaryColorVariant,
                //       ),
                //       autovalidateMode: AutovalidateMode.onUserInteraction,
                //       validator: (value) {
                //         if (value == null) {
                //           return "Provinsi tidak boleh kosong";
                //         }
                //         return null;
                //       },
                //       decoration: InputDecoration(labelText: "Provinsi *"),
                //     );
                //   },
                // ),
                // SizedBox(height: 16),
                // selectedProvince != null
                //     ? BlocBuilder<CitiesCubit, CitiesState>(
                //         builder: (context, state) {
                //           return DropdownButtonFormField(
                //             hint: Text(
                //               "Pilih Kabupaten / Kota",
                //               style: GoogleFonts.rubik(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             value: selectedCities,
                //             items: state.citiesModel?.data.cities
                //                 .map(
                //                   (e) => DropdownMenuItem(
                //                     child: Text(
                //                       e.name,
                //                       style: GoogleFonts.rubik(
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w500,
                //                       ),
                //                     ),
                //                     value: e,
                //                   ),
                //                 )
                //                 .toList(),
                //             onChanged: (value) {
                //               setState(() {
                //                 context
                //                     .read<DistrictCubit>()
                //                     .getDistrict(value!.id);
                //                 if (selectedCities == null)
                //                   selectedCities = value;
                //                 if (selectedCities != null) {
                //                   selectedDistrict = null;
                //                   selectedArea = null;
                //                   selectedCities = value;
                //                 }
                //               });
                //             },
                //             icon: Icon(
                //               Icons.arrow_drop_down,
                //               color: secondaryColorVariant,
                //             ),
                //             autovalidateMode:
                //                 AutovalidateMode.onUserInteraction,
                //             validator: (value) {
                //               if (value == null) {
                //                 return "Kabupaten / Kota tidak boleh kosong";
                //               }
                //               return null;
                //             },
                //             decoration: InputDecoration(
                //                 labelText: "Kabupaten / Kota *"),
                //           );
                //         },
                //       )
                //     : SizedBox(),
                // selectedProvince != null ? SizedBox(height: 16) : SizedBox(),
                // selectedCities != null
                //     ? BlocBuilder<DistrictCubit, DistrictState>(
                //         builder: (context, state) {
                //           return DropdownButtonFormField(
                //             hint: Text(
                //               "Pilih Kecamatan",
                //               style: GoogleFonts.rubik(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             value: selectedDistrict,
                //             items: state.districtModel?.data.district
                //                 .map(
                //                   (e) => DropdownMenuItem(
                //                     child: Text(
                //                       e.name,
                //                       style: GoogleFonts.rubik(
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w500,
                //                       ),
                //                     ),
                //                     value: e,
                //                   ),
                //                 )
                //                 .toList(),
                //             onChanged: (value) {
                //               setState(() {
                //                 context.read<AreaCubit>().getArea(value!.id);
                //                 if (selectedDistrict == null)
                //                   selectedDistrict = value;
                //                 if (selectedDistrict != null) {
                //                   selectedArea = null;
                //                   selectedDistrict = value;
                //                 }
                //               });
                //             },
                //             icon: Icon(
                //               Icons.arrow_drop_down,
                //               color: secondaryColorVariant,
                //             ),
                //             autovalidateMode:
                //                 AutovalidateMode.onUserInteraction,
                //             validator: (value) {
                //               if (value == null) {
                //                 return "Kecamatan tidak boleh kosong";
                //               }
                //               return null;
                //             },
                //             decoration:
                //                 InputDecoration(labelText: "Kecamatan *"),
                //           );
                //         },
                //       )
                //     : SizedBox(),
                // selectedCities != null ? SizedBox(height: 16) : SizedBox(),
                // selectedDistrict != null
                //     ? BlocBuilder<AreaCubit, AreaState>(
                //         builder: (context, state) {
                //           return DropdownButtonFormField(
                //             hint: Text(
                //               "Pilih Kelurahan",
                //               style: GoogleFonts.rubik(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             value: selectedArea,
                //             items: state.areaModel?.data.area
                //                 .map(
                //                   (e) => DropdownMenuItem(
                //                     child: Text(
                //                       e.name,
                //                       style: GoogleFonts.rubik(
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w500,
                //                       ),
                //                     ),
                //                     value: e,
                //                   ),
                //                 )
                //                 .toList(),
                //             onChanged: (value) {
                //               setState(() {
                //                 selectedArea = value;
                //               });
                //             },
                //             icon: Icon(
                //               Icons.arrow_drop_down,
                //               color: secondaryColorVariant,
                //             ),
                //             autovalidateMode:
                //                 AutovalidateMode.onUserInteraction,
                //             validator: (value) {
                //               if (value == null) {
                //                 return "Kelurahan tidak boleh kosong";
                //               }
                //               return null;
                //             },
                //             decoration:
                //                 InputDecoration(labelText: "Kelurahan *"),
                //           );
                //         },
                //       )
                //     : SizedBox(),
                // selectedDistrict != null ? SizedBox(height: 16) : SizedBox(),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    height: 48,
                    child: Center(
                      child: Text(
                        "Simpan",
                        style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
