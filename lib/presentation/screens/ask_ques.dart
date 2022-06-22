import 'package:astrotak/data/models/question_category.dart';
import 'package:astrotak/logic/cubit/question_category_cubit.dart';
import 'package:astrotak/presentation/theme/astro_colors.dart';
import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:astrotak/logic/cubit/internet_cubit.dart';
import 'package:astrotak/presentation/widgets/ques_category_dropdown.dart';
import 'package:astrotak/presentation/widgets/ques_suggestion_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AskQuestions extends StatefulWidget {
  const AskQuestions({Key? key}) : super(key: key);

  @override
  State<AskQuestions> createState() => _AskQuestionsState();
}

class _AskQuestionsState extends State<AskQuestions> {
  late ScrollController _scrollViewController, _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) async {
        if (state is InternetConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Internet Connected')));

          // Fetching the Question Categories List.
          context.read<QuestionCategoryCubit>().getQuestionCategories();
        } else if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Internet Disconnected')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Image.asset('assets/icons/hamburger.png'),
          ),
          leadingWidth: size.width * 0.09,
          title: Image.asset(
            'assets/icons/icon.png',
            width: size.width * 0.15,
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  'assets/icons/profile.png',
                  width: size.width * 0.06,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: secondaryColor,
            onPressed: () {},
            child: Image.asset(
              'assets/icons/menu.png',
              width: 20.0,
            )),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: primaryColor,
                width: size.width,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Wallet Balance : ₹0',
                      style: h2_heading.copyWith(color: Colors.white),
                    ),
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
                          style:
                              p3_bold_paragraph.copyWith(color: primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollViewController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ask a Question',
                          style: h2_heading,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with the remedies.',
                          style: p1_paragraph,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const Text(
                          'Choose Category',
                          style: h2_heading,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        BlocBuilder<QuestionCategoryCubit,
                            QuestionCategoryState>(
                          builder: (context, state) {
                            if (state is QuestionCategoryLoaded) {
                              return QuesCategoryDropDown(
                                questionCategoryList:
                                    state.questionCategoryDataList,
                                callback: (index) {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                              );
                            } else if (state is QuestionCategoryLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: secondaryColor,
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          maxLines: 4,
                          maxLength: 150,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              hintText: 'Type a question here',
                              hintStyle:
                                  p1_paragraph.copyWith(color: Colors.grey),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Ideas what to Ask (Select Any)',
                          style: h2_heading,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        BlocBuilder<QuestionCategoryCubit,
                            QuestionCategoryState>(
                          builder: (context, state) {
                            if (state is QuestionCategoryLoaded) {
                              return QuesSuggestionList(
                                suggestionsList: state
                                    .questionCategoryDataList[_selectedIndex]
                                    .suggestions!,
                                controller: _controller,
                                width: size.width,
                              );
                            } else if (state is QuestionCategoryLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: secondaryColor,
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.',
                          style: p1_paragraph,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          color: bgColor,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '\u2022 Personalized responses provided by our team of vedic astrologers within 24 hours.',
                                style: p1_paragraph.copyWith(
                                    color: secondaryColor),
                              ),
                              Text(
                                '\u2022 Qualified and experienced astrologers will look into your birth chart and provide the right guidance.',
                                style: p1_paragraph.copyWith(
                                    color: secondaryColor),
                              ),
                              Text(
                                '\u2022 You can seek answers to any part of your lives and for most pressing issues.',
                                style: p1_paragraph.copyWith(
                                    color: secondaryColor),
                              ),
                              Text(
                                '\u2022 Our team of vedic astrologers will not just provide answers but also suggest a remedial solution.',
                                style: p1_paragraph.copyWith(
                                    color: secondaryColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
