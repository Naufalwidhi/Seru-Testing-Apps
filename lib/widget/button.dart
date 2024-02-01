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
    this.isBlockSize = true,
    this.outlined = false,
    this.isFullWidth = false,
    this.trailingIcon,
    this.needBorderSide = true,
  }) : super(key: key);

  final String text;

  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final bool isBlockSize;
  final bool outlined;
  final bool isFullWidth;
  final Widget? trailingIcon;
  final bool needBorderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: (isBlockSize)
            ? Size(
                MediaQuery.of(context).size.width - (isFullWidth ? 0 : 48),
                50.0,
              )
            : null,
        minimumSize: const Size(40, 40),
        primary:
            (outlined) ? Colors.white : Theme.of(context).colorScheme.secondary,
        onPrimary:
            (outlined) ? Theme.of(context).colorScheme.secondary : Colors.white,
        side: needBorderSide
            ? BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 1,
              )
            : const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
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
          : DefaultCircularProgress(
              color: (outlined)
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
    );
  }
}
