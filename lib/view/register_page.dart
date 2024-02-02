import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seru_testing_app/view/register_page_2.dart';
import 'package:seru_testing_app/widget/button.dart';
import 'package:seru_testing_app/widget/text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController biodataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              "Step 1 of 3",
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
                      color: Colors.grey[400],
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                Text(
                  "R E G I S T R A T I O N",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Identity",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "First Name",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                DefaultOutlineTextFormField(
                  controller: firstNameController,
                  onTapOutside: (event) {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "First Name Cannot Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  "Last Name",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                DefaultOutlineTextFormField(
                  controller: lastNameController,
                  onTapOutside: (event) {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Last Name Cannot Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  "Biodata",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                DefaultOutlineTextFormField(
                  controller: lastNameController,
                  maxLines: 4,
                  onTapOutside: (event) {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Biodata Cannot Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DefaultButton(
                  text: "Next",
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    Navigator.pushNamed(
                      context,
                      "/register-2",
                      arguments: RegisterPage2Arguments(
                        firstNameController.text.toString(),
                        lastNameController.text.toString(),
                        biodataController.text.toString(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
