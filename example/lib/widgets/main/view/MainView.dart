import 'package:example/widgets/main/core/MainViewModel.dart';
import 'package:flutter/material.dart';
import 'package:clean_ui/clean_ui.dart';
import 'package:provider/src/provider.dart';

import '../models/Gender.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: LenoreDrawer(
          header: Container(
            height: 100,
            alignment: Alignment.center,
            color: Theme.of(context).disabledColor,
          ),
          drawerItems: [
            LenoreDrawerItem(
              text: 'First Drawer Item Selected',
              icon: Icons.person,
              isSelected: true,
            ),
            LenoreDrawerItem(
              text: 'Second Drawer Item',
              icon: Icons.dashboard,
              isSelected: false,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Responsive
                Text(
                  Responsive.isDesktop(context)
                      ? "Screen size is DESKTOP size!"
                      : Responsive.isMobile(context)
                          ? "Screen size is MOBILE size!"
                          : "Screen size is TABLET size!",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreButton
                Text(
                  'LenoreCheckBox',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 8),
                LenoreCheckBox(
                  value: context.watch<MainViewModel>().canFly ?? false,
                  onChanged: (value) {
                    context.read<MainViewModel>().canFly = value;
                  },
                  textString: 'Ever feel the freedom of soaring through the sky? Do you wanna?',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreButton
                Text(
                  'LenoreButton',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 8),
                LenoreButton(
                  caption: 'Change Dark Mode',
                  onPressed: () {
                    context.read<MainViewModel>().toggleDarkMode(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreDatePicker
                Text(
                  'LenoreDatePicker',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreDropDown
                Text(
                  'LenoreDropDown',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreDropDown(
                  items: context.read<MainViewModel>().genders,
                  value: context.watch<MainViewModel>().genderValue,
                  onChange: (Gender newValue) => context.read<MainViewModel>().onGenderChange(newValue),
                  label: 'Gender',
                  icon: Icons.wc_rounded,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreFlatButton
                Text(
                  'LenoreFlatButton',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreFlatButton(
                  caption: 'A Flat Button',
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreLoading
                Text(
                  'LenoreLoading',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreLoading(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreTextFormField
                Text(
                  'LenoreTextFormField',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreTextFormField(
                  controller: TextEditingController(),
                  label: 'Enter Your Name',
                  maxLines: 5,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreNoDataWidget
                Text(
                  'LenoreNoDataWidget',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreNoDataWidget(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(endIndent: 64),
                ),
                // LenoreNoInternetWidget
                Text(
                  'LenoreNoInternetWidget',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 16),
                LenoreNoInternetWidget(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
