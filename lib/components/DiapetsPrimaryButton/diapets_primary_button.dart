import 'package:flutter/material.dart';

class DiapetsPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool loading;
  final Color? borderColor;
  const DiapetsPrimaryButton({
    super.key,
    this.onPressed,
    this.loading = false,
    this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Color overridenBorderColor = borderColor ?? Theme.of(context).primaryColor;

    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: overridenBorderColor,
          foregroundColor: const Color(0xFFFCFCFC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: loading
            ? const CircularProgressIndicator(
                color: Color(0xFFFCFCFC),
              )
            : child,
      ),
    );
  }
}
