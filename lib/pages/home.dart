import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness/models/category_model.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitials() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitials();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(children: [
          _searchField(),
          const SizedBox(height: 40),
          _categorySection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Popular',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.separated(
                    itemCount: popularDiets.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 25),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              popularDiets[index].iconPath,
                              height: 100,
                              width: 100,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  popularDiets[index].name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  popularDiets[index].level +
                                      ' | ' +
                                      popularDiets[index].duration +
                                      ' |' +
                                      popularDiets[index].calorie,
                                  style: const TextStyle(
                                    color: Color(0xff7B6f72),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/button.svg',
                                height: 20,
                                width: 20,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: popularDiets[index].boxIsSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          boxShadow: [
                            BoxShadow(
                              color: popularDiets[index].boxIsSelected
                                  ? Colors.black.withOpacity(0.11)
                                  : Colors.transparent,
                              spreadRadius: 0,
                              blurRadius: 40.0,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          )
        ]));
  }

  Column _dietSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation for Diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
            height: 200,
            child: ListView.separated(
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          diets[index].iconPath,
                        ),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              diets[index].level +
                                  ' | ' +
                                  diets[index].duration +
                                  ' |' +
                                  diets[index].calorie,
                              style: const TextStyle(
                                color: Color(0xff7B6f72),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    diets[index].viewIsSelected
                                        ? Color.fromARGB(255, 88, 174, 217)
                                        : Colors.transparent,
                                    diets[index].viewIsSelected
                                        ? Color.fromARGB(255, 199, 231, 240)
                                        : Colors.transparent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                    color: diets[index].viewIsSelected
                                        ? Colors.white
                                        : Color(0xffc58BF2),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              },
            )),
      ],
    );
  }

  Column _categorySection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            categories[index].iconPath,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            spreadRadius: 0.0,
            blurRadius: 40.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          hintText: 'Search for recipes',
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 189, 189, 189),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
              height: 20,
              width: 20,
            ),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/arrow.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
