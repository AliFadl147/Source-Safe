import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_background_container.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/test/latest_transction.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/test/quick_invoice_form.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/test/quick_invoice_header.dart';

class QuickInvoice extends StatelessWidget {
  const   QuickInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuickInvoiceHeader(),
        LatestTransction(),
        Divider(
          height: 48,
          color: Color(0xffF1F1F1),
        ),
        QuickInvoiceForm(),
      ],
    ));
  }
}
