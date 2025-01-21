import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/file_check_box_cubit/file_check_box_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_group_files_cubit/get_group_files_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/all_user_groups_and_all_group_files_widgets/custom_file_card.dart';
import 'package:source_safe_project/core/utils/api_service.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';

class AllGroupFilesListView extends StatefulWidget {
  const AllGroupFilesListView({super.key});

  @override
  State<AllGroupFilesListView> createState() => _AllGroupFilesListViewState();
}

class _AllGroupFilesListViewState extends State<AllGroupFilesListView> {
  AppPreferences appPreferences = getIt.get<AppPreferences>();
  final ScrollController _scrollController = ScrollController();

  Future<void> _initializeData() async {
    try {
      if (!mounted) return;
      GetGroupFilesCubit.get(context).getGroupFiles(groupId: groupId);
    } catch (e) {
      if (mounted) {
        print('Error: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeData(); // Call the async initializer
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGroupFilesCubit, GetGroupFilesState>(
      builder: (context, state) {
        return BlocBuilder<FileCheckBoxCubit, FileCheckBoxState>(
          builder: (context, fileCheckBoxState) {
            return state is GetGroupFilesSuccess
                ? GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      _scrollController.jumpTo(
                        _scrollController.offset - details.delta.dx,
                      );
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      child: Row(
                        children: state.fileModel.items
                            .map((e) => IntrinsicWidth(
                                    child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    if (!(e.isReserved ?? true)) {
                                      return handleFileTap(
                                        context: context,
                                        filePath: e.filePath ?? '',
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: CustomFileCard(
                                    fileId: e.fileId,
                                    fileName: e.fileName,
                                    filePath: e.filePath ?? '',
                                    isReserved: e.isReserved,
                                  ),
                                )))
                            .toList(),
                      ),
                    ),
                  )
                : state is GetGroupFilesFailure
                    ? Center(
                        child: Text('There is no files in this group yet',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14,
                                    )),
                      )
                    : SizedBox();
          },
        );
      },
    );
  }
}
