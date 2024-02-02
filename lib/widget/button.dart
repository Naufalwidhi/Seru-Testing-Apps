import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seru_testing_app/widget/circular_progress.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.outlined = false,
    this.isFullWidth = false,
    this.trailingIcon,
    this.needBorderSide = true,
  }) : super(key: key);

  final String text;

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool outlined;
  final bool isFullWidth;
  final Widget? trailingIcon;
  final bool needBorderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0,
      ),
      onPressed: (isDisabled || isLoading) ? null : onPressed,
      child: (!isLoading)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                trailingIcon ?? const SizedBox(),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    color: (outlined)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          : const DefaultCircularProgress(
              color: Colors.white,
            ),
    );
  }
}
