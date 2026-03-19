import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/core/widgets/appbar.dart';
import 'package:super_app/core/widgets/title_text_see_all.dart';
import 'package:super_app/features/feed/presentation/cubit/department/department_cubit.dart';
import 'package:super_app/features/feed/presentation/widgets/departments_section.dart';
import 'package:super_app/features/feed/presentation/widgets/feed_hero_section.dart';
import 'package:super_app/injection_container.dart';
import 'package:super_app/core/constants/string_constants.dart';
@RoutePage()
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});
  @override
  Widget build(BuildContext context) {
    /*
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
    */
    
    // ! Sliver yapısına geç
    return BlocProvider.value(
      value: sl<DepartmentCubit>()..fetchDepartments(),
      child: Scaffold(
        appBar: AppBarWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [

              HeroSection(),
              
              const TitleWithSeeAll(text: StringConstants.mainPageTitleOne),
              const DepartmentsSection(),

              const TitleWithSeeAll(text: StringConstants.mainPageTitleTwo),
              const DepartmentsSection(),

              const TitleWithSeeAll(text: StringConstants.mainPageTitleThree),
              const DepartmentsSection(),
              
            ],
          ),
        )
      ),
    );
  }
}
