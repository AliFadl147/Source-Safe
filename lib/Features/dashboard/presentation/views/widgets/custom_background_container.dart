import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/core/manager/change_mode_cubit/change_mode_cubit.dart';

class CustomBackgroundCard extends StatelessWidget {
  const CustomBackgroundCard({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeModeCubit, ChangeModeState>(
      builder: (context, state) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding ?? 20),
            child: child,
          ),
        );
      },
    );
  }
}
