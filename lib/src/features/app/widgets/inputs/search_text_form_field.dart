import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/settings/app_colors.dart';

class SearchTextFormField extends StatefulWidget {
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onStopTypping;
  final bool enabled;

  const SearchTextFormField(
      {Key? key,
      required this.placeholder,
      this.onChanged,
      this.onStopTypping,
      this.enabled = true})
      : super(key: key);

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  bool writing = false;

  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    myFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(Duration(seconds: 1), () {
      if (widget.onStopTypping != null) {
        widget.onStopTypping!(_controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        child: TextFormField(
          focusNode: myFocusNode,
          controller: _controller,
          onChanged: (value) {
            _onSearchChanged();
            setState(() => writing = value.isNotEmpty);
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          enabled: widget.enabled,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-ZÀ-ÖØ-öø-ÿ ]"))
          ],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            hintStyle: const TextStyle(
              color: AppColors.grey,
            ),
            hintText: widget.placeholder,
            hintMaxLines: 1,
            enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.blackFirst, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            disabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.blackFirst, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.blackFirst, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            suffixIcon: Container(
              margin: EdgeInsets.only(right: 6.w),
              width: 55.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.text = "";
                      setState(() => writing = false);
                      if (widget.onChanged != null) {
                        widget.onChanged!("");
                      }
                      if (widget.onStopTypping != null) {
                        widget.onStopTypping!("");
                      }
                      myFocusNode.unfocus();
                    },
                    child: Icon(
                      !writing ? Icons.search : Icons.cancel_outlined,
                      color: AppColors.redFirst,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
