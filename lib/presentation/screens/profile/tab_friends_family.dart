import 'package:astrotak/logic/bloc/relatives_bloc.dart';
import 'package:astrotak/presentation/screens/profile/bottomsheet/add_member.dart';
import 'package:astrotak/presentation/widgets/relatives_list.dart';
import 'package:astrotak/presentation/theme/astro_colors.dart';
import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:astrotak/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TabFriendsAndFamily extends StatefulWidget {
  const TabFriendsAndFamily({Key? key}) : super(key: key);

  @override
  State<TabFriendsAndFamily> createState() => _TabFriendsAndFamilyState();
}

class _TabFriendsAndFamilyState extends State<TabFriendsAndFamily> {
  late ScrollController _scrollController;

  void _fetchData() {
    final internetState = context.read<InternetCubit>().state;
    if (internetState is InternetConnected) {
      context.read<RelativesBloc>().add(FetchRelative());
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _fetchData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          context.read<RelativesBloc>().add(FetchRelative());
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'Internet Connected',
          )));
        } else if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'Internet Disconnected',
          )));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryLight,
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/wallet.png',
                    width: 24.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Wallet Balance : ₹0',
                    style: p1_paragraph.copyWith(color: primaryColor),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.black)),
                      child: Text(
                        'Add Money',
                        style: p3_bold_paragraph.copyWith(color: primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Name',
                    style: p2_paragraph.copyWith(color: primaryColor),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  Text(
                    'DOB',
                    style: p2_paragraph.copyWith(color: primaryColor),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    'TOB',
                    style: p2_paragraph.copyWith(color: primaryColor),
                  ),
                  const SizedBox(
                    width: 45.0,
                  ),
                  Text(
                    'Relation',
                    style: p2_paragraph.copyWith(color: primaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            BlocBuilder<RelativesBloc, RelativesState>(
              builder: (context, state) {
                if (state is RelativesLoaded) {
                  return RelativesList(
                    allRelatives: state.allRelatives,
                    controller: _scrollController,
                  );
                } else if (state is RelativesLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: secondaryColor,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            TextButton.icon(
                style: TextButton.styleFrom(backgroundColor: secondaryColor),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return BlocProvider.value(
                          value: context.read<RelativesBloc>(),
                          child: const AddMember(),
                        );
                      });
                },
                icon: const Icon(
                  Icons.add,
                  size: 16.0,
                  color: Colors.white,
                ),
                label: Text(
                  'Add New Profile',
                  style: p2_paragraph.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
