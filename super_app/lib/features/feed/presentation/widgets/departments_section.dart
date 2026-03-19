import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/widgets/content_card.dart';
import 'package:super_app/core/widgets/horizontal_card_list.dart';
import 'package:super_app/features/feed/presentation/cubit/department/department_cubit.dart';
import 'package:super_app/features/feed/presentation/cubit/department/department_state.dart';

class DepartmentsSection extends StatelessWidget {
  const DepartmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        if (state is DepartmentLoading) {
          return const SizedBox(
            height: 240,
            child: CircularProgressIndicator(),
          );
        } else if (state is DepartmentLoaded) {
          return HorizontalCardList(
            itemCount: state.departments.length,
            height: 240, // yükseklik
            cardWidthRatio: 0.6, // sağdan solal yüzde kaç oranı
            itemBuilder: (context, index) {
              final department = state.departments[index];

              return ContentCard(
                title: department.departmentId.toString(),
                subtitle: department.displayName!,
                onTap: () {},
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
