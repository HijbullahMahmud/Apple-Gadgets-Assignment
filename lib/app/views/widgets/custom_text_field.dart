import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.hintText,
      this.isDense = false,
      this.textInputType,
      this.contentPadding,
      this.maxLine,
      this.borderRadius,
      this.controller,
      this.prefixIcon,
      this.onChanged,
      this.suffixIcon,
      this.isObscure = false,
      this.onSuffixPressed,
      this.textInputAction,
      this.textInputFormatter,
      this.errorText});
  final String labelText;
  final String? hintText;
  final bool? isDense;
  final double? borderRadius;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final double? contentPadding;
  final int? maxLine;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onSuffixPressed;
  final bool isObscure;
  final TextInputAction? textInputAction;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      maxLines: isObscure ? 1 : maxLine,
      autocorrect: true,
      obscureText: isObscure,
      textInputAction: textInputAction,
      inputFormatters: textInputFormatter,
      onChanged: (value) => onChanged != null ? onChanged!(value) : null,
      decoration: InputDecoration(
        error: errorText != null
            ? Text(
                errorText ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.red),
              )
            : null,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    border: const Border(
                      right: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
                  ),
                  child: Icon(
                    prefixIcon,
                    color: Colors.grey,
                  ),
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: InkWell(
                  onTap: onSuffixPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      border: const Border(
                        left: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
                    ),
                    child: Icon(
                      suffixIcon,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 4.0))),
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
        isDense: isDense,
        hintText: hintText ?? labelText,
        hintStyle:
            Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
        contentPadding: EdgeInsets.all(contentPadding ?? 8),
      ),
    );
  }
}
