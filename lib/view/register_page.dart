import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seru_testing_app/logic/region_cubit.dart';
import 'package:seru_testing_app/model/area_model.dart';
import 'package:seru_testing_app/model/city_model.dart';
import 'package:seru_testing_app/model/district_model.dart';
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
  TextEditingController biodataController = TextEditingController();
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
  ProvinceData? selectedProvince;
  CityData? selectedCities;
  DistrictData? selectedDistrict;
  AreaData? selectedArea;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProvinceCubit(
            regionRepository: RegionRepository.create(),
          )..getProvince(),
        ),
        BlocProvider(
          create: (context) => CityCubit(
            regionRepository: RegionRepository.create(),
          ),
        ),
        BlocProvider(
          create: (context) => DistrictCubit(
            regionRepository: RegionRepository.create(),
          ),
        ),
        BlocProvider(
          create: (context) => AreaCubit(
            regionRepository: RegionRepository.create(),
          ),
        ),
      ],
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTapOutside: (event) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
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
                            enabledBorder: UnderlineInputBorder(
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null) {
                              return "First Name Can't Empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          onTapOutside: (event) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
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
                            enabledBorder: UnderlineInputBorder(
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null) {
                              return "Last Name Can't Empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Catatan Tambahan",
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    onTapOutside: (event) {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    cursorColor: Colors.blueGrey,
                    controller: biodataController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blueGrey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<ProvinceCubit, ProvinceState>(
                    builder: (context, state) {
                      return DropdownButtonFormField(
                        hint: Text(
                          "Pilih Provinsi",
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey,
                          ),
                        ),
                        value: selectedProvince,
                        items: state.model?.data
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.name,
                                  style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            context.read<CityCubit>().getCity(value!.id);
                            if (selectedProvince == null) {
                              selectedProvince = value;
                            } else if (selectedProvince != null) {
                              selectedCities = null;
                              selectedDistrict = null;
                              selectedArea = null;
                              selectedProvince = value;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blueGrey,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null) {
                            return "Provinsi tidak boleh kosong";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Provinsi *",
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          focusColor: Colors.blueGrey,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  selectedProvince != null
                      ? BlocBuilder<CityCubit, CityState>(
                          builder: (context, state) {
                            return DropdownButtonFormField(
                              hint: Text(
                                "Pilih Kabupaten / Kota",
                                style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueGrey),
                              ),
                              value: selectedCities,
                              items: state.model?.data
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  context
                                      .read<DistrictCubit>()
                                      .getDistrict(value!.id);
                                  selectedCities ??= value;
                                  if (selectedCities != null) {
                                    selectedDistrict = null;
                                    selectedArea = null;
                                    selectedCities = value;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blueGrey,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null) {
                                  return "Kabupaten / Kota tidak boleh kosong";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Kabupaten / Kota *",
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusColor: Colors.blueGrey,
                              ),
                            );
                          },
                        )
                      : const SizedBox(),
                  selectedProvince != null
                      ? const SizedBox(height: 16)
                      : const SizedBox(),
                  selectedCities != null
                      ? BlocBuilder<DistrictCubit, DistrictState>(
                          builder: (context, state) {
                            return DropdownButtonFormField(
                              hint: Text(
                                "Pilih Kecamatan",
                                style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueGrey),
                              ),
                              value: selectedDistrict,
                              items: state.model?.data
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  context.read<AreaCubit>().getArea(value!.id);
                                  selectedDistrict ??= value;
                                  if (selectedDistrict != null) {
                                    selectedArea = null;
                                    selectedDistrict = value;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blueGrey,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null) {
                                  return "Kecamatan tidak boleh kosong";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Kecamatan *",
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusColor: Colors.blueGrey,
                              ),
                            );
                          },
                        )
                      : const SizedBox(),
                  selectedCities != null
                      ? const SizedBox(height: 16)
                      : const SizedBox(),
                  selectedDistrict != null
                      ? BlocBuilder<AreaCubit, AreaState>(
                          builder: (context, state) {
                            return DropdownButtonFormField(
                              hint: Text(
                                "Pilih Kelurahan",
                                style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueGrey),
                              ),
                              value: selectedArea,
                              items: state.model?.data
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedArea = value;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null) {
                                  return "Kelurahan tidak boleh kosong";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "Kelurahan *",
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusColor: Colors.blueGrey,
                              ),
                            );
                          },
                        )
                      : const SizedBox(),
                  selectedDistrict != null
                      ? const SizedBox(height: 16)
                      : const SizedBox(),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      if (!formKey.currentState!.validate()) {
                        showWarning();
                        return;
                      }
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blueGrey,
                      ),
                      width: double.infinity,
                      height: 48,
                      child: Center(
                        child: Text(
                          "Simpan",
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showWarning() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Text(
              'Error',
              style: GoogleFonts.rubik(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Terdapat kesalahan pada pengisian data. Mohon cek ulang dan diisi semua yang dibutuhkan",
              style: GoogleFonts.rubik(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: Text(
                        'Oke',
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
