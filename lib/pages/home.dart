import 'package:firebase_rlt/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> categories = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: _appBarSection(),
      body: ListView(children: [
        _searchBarSection(),
        const SizedBox(
          height: 40,
        ),
        _categorySection(),
        const SizedBox(
          height: 40,
        ),
      ]),
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Category ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 165,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                print('You click on ${categories[index].name}');
              },
              child: Container(
                //margin: const EdgeInsets.all(20),
                width: 150,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                        //color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
            ),
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
          ),
        )
      ],
    );
  }

  Container _searchBarSection() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 15,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.search),
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              print('Filter icon Tapped');
            },
            child: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBarSection() {
    return AppBar(
      title: const Text('Dashboard'),
      titleTextStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          print('App Drawer tapped');
        },
        child: Container(
          margin: const EdgeInsets.all(15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            //color: const Color.fromARGB(255, 155, 150, 150),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Icon(
            Icons.menu,
            size: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print('Dot Dot tapped');
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 37,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              //color: const Color.fromARGB(255, 155, 150, 150),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        )
      ],
    );
  }
}
