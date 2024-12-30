import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/widgets/custom_button.dart';

class QuickInvoiceForm extends StatelessWidget {
  const QuickInvoiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     Expanded(
        //         child: TitleTextField(
        //             title: 'Customer name', hint: 'Type customer name')),
        //     SizedBox(
        //       width: 16,
        //     ),
        //     Expanded(
        //       child: TitleTextField(
        //           title: 'Customer Email', hint: 'Type customer email'),
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: 24,
        // ),
        // Row(
        //   children: [
        //     Expanded(
        //         child: TitleTextField(
        //             title: 'Item name', hint: 'Type customer name')),
        //     SizedBox(
        //       width: 16,
        //     ),
        //     Expanded(
        //       child: TitleTextField(title: 'Item mount', hint: 'USD'),
        //     ),
        //   ],
        // ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                foregroundColor: AppColors.white,
                text: 'A',
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: CustomButton(
                foregroundColor: AppColors.white,
                text: 'A',
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
