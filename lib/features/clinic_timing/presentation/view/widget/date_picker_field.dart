
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/post_appointment/post_appointment_cubit.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  // final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // String formatted = DateFormat('MMMM d, y').format(pickedDate);
      setState(() {
        // _controller.text = formatted;
      context.read<PostAppointmentCubit>().setDate(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomEditTextFormField(
      controller: context.read<PostAppointmentCubit>().dateController,
      readOnly: true,
      hintTxt: S.of(context).thisWeek,
      suffixIcon: IconButton(
        icon: SvgPicture.asset(AppIcons.svgCalender),
        onPressed: () => _selectDate(context),
      ),
    );
  }
}
