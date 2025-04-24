import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class ClinicStatus extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? status;

  const ClinicStatus(
      {super.key, required this.controller, this.onChanged, this.status});

  @override
  State<ClinicStatus> createState() => _ClinicStatusState();
}

class _ClinicStatusState extends State<ClinicStatus> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    final List<String> branchStatuses = [
      S.of(context).open,
      S.of(context).close
    ];
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        CustomEditTextFormField(
          controller: widget.controller,
          hintTxt: S.of(context).clinicStatus,
          initialVal: widget.status,
          readOnly: true,
        ),
        Positioned(
          right: 15.h,
          left: 15.h,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              icon: SvgPicture.asset(AppIcons.svgArrowDown),
              onChanged: (String? newValue) {
                setState(() {
                  selectedStatus = newValue;
                  widget.controller.text = newValue ?? "";
                  if (widget.onChanged != null) {
                    widget.onChanged!(newValue!);
                  }
                });
              },
              items: branchStatuses.map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: SizedBox(
                    width: 132.w,
                    child: Text(status, textAlign: TextAlign.start),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
