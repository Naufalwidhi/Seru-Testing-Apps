import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seru_testing_app/logic/region_cubit.dart';
import 'package:seru_testing_app/model/area_model.dart';
import 'package:seru_testing_app/model/city_model.dart';
import 'package:seru_testing_app/model/district_model.dart';
import 'package:seru_testing_app/model/province_model.dart';
import 'package:seru_testing_app/services/region_repository.dart';
import 'package:seru_testing_app/view/register_page_3.dart';
import 'package:seru_testing_app/widget/button.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  ProvinceData? selectedProvince;
  CityData? selectedCities;
  DistrictData? selectedDistrict;
  AreaData? selectedArea;
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RegisterPage2Arguments;
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
        appBar: AppBar(
          title: Center(
            child: Text(
              "R E G I S T R A T I O N",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Step 2 of 3",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Address",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Provinsi",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<ProvinceCubit, ProvinceState>(
                    builder: (context, state) {
                      return DropdownButtonFormField(
                        hint: Text(
                          "Pilih Provinsi",
                          style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
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
                                    fontSize: 12,
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
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
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
                  Text(
                    "Kabupaten / Kota",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  selectedProvince != null
                      ? BlocBuilder<CityCubit, CityState>(
                          builder: (context, state) {
                            return DropdownButtonFormField(
                              hint: Text(
                                "Pilih Kabupaten / Kota",
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              value: selectedCities,
                              items: state.model?.data
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: 12,
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
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusColor: Colors.blueGrey,
                              ),
                            );
                          },
                        )
                      : Container(
                          height: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade600),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pilih Kabupaten / Kota",
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blueGrey,
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 16),
                  Text(
                    "Kecamatan",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  selectedCities != null
                      ? BlocBuilder<DistrictCubit, DistrictState>(
                          builder: (context, state) {
                            return DropdownButtonFormField(
                              hint: Text(
                                "Pilih Kecamatan",
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              value: selectedDistrict,
                              items: state.model?.data
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: 12,
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
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusColor: Colors.blueGrey,
                              ),
                            );
                          },
                        )
                      : Container(
                          height: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade600),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pilih Kecamatan",
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blueGrey,
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 16),
                  Text(
                    "Kelurahan",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  selectedDistrict != null
                      ? BlocBuilder<AreaCubit, AreaState>(
                          builder: (context, state) {
                            return DropdownButtonFormField(
                              hint: Text(
                                "Pilih Kelurahan",
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
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
                                          fontSize: 12,
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
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusColor: Colors.blueGrey,
                              ),
                            );
                          },
                        )
                      : Container(
                          height: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade600),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pilih Kecamatan",
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blueGrey,
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 24),
                  DefaultButton(
                    text: "Next",
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      Navigator.pushNamed(
                        context,
                        "/register-3",
                        arguments: RegisterPage3Arguments(
                          args.firstName,
                          args.lastName,
                          args.biodata,
                          selectedProvince!.name,
                          selectedCities!.name,
                          selectedDistrict!.name,
                          selectedArea!.name,
                        ),
                      );
                    },
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
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
      },
    );
  }
}

class RegisterPage2Arguments {
  const RegisterPage2Arguments(
    this.firstName,
    this.lastName,
    this.biodata,
  );
  final String firstName;
  final String lastName;
  final String biodata;
}
