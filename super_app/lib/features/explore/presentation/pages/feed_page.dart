import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/widgets/appbar.dart';
import 'package:super_app/features/feed/presentation/cubit/department_cubit.dart';
import 'package:super_app/features/feed/presentation/cubit/department_state.dart';
import 'package:super_app/injection_container.dart';

@RoutePage()
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<DepartmentCubit>()..fetchDepartments(),
      child: Scaffold(
        appBar: AppBarWidget(),
        body: BlocBuilder<DepartmentCubit, DepartmentState>(
          builder: (context, state) {
            if (state is DepartmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DepartmentLoaded) {
              return Text('yüklendi');
            } else if (state is DepartmentError) {
              return Text('hata verdi');
            }
            return const Center(child: Text('yükleniyor'));
          },
        ),
      ),
    );
  }
}
