import 'package:flutter/material.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FillProfile extends StatefulWidget {
  FillProfile({Key? key}) : super(key: key);

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  final controller = PageController(viewportFraction: 1, keepPage: true);
  final TextEditingController firstName = TextEditingController();

  final TextEditingController secondName = TextEditingController();

  final TextEditingController thirdName = TextEditingController();

  final TextEditingController lastName = TextEditingController();

  final TextEditingController nationalIdCard = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final TextEditingController dateOfBirth = TextEditingController();

  final TextEditingController religion = TextEditingController();

  final TextEditingController gender = TextEditingController();

//  final TextEditingController maritalStatus = TextEditingController();
  final TextEditingController nationality = TextEditingController();

  final TextEditingController bloodType = TextEditingController();

  final TextEditingController fullAddress = TextEditingController();

  final TextEditingController country = TextEditingController();

  final TextEditingController city = TextEditingController();

  final TextEditingController streetName = TextEditingController();

  final TextEditingController appartmentNumber = TextEditingController();

  final TextEditingController buildingNumber = TextEditingController();

  final TextEditingController job = TextEditingController();
  @override
  void initState() {
    dateOfBirth.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.fillYourProfile),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                pageSnapping: true,
                padEnds: false,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {},
                children: [
                  fillProfile1(),
                  fillProfile2(),
                  fillProfile3(),
                  fillProfile4(),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotHeight: AppSizeHeight.s16,
                    dotWidth: AppSizeWidth.s16,
                    activeDotColor: ColorManager.primary,
                    strokeWidth: AppSizeWidth.s4,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(AppSizeWidth.s80, AppSizeHeight.s40)),
                    onPressed: () {
                      if (controller.page == 0) {
                        if (formKey1.currentState!.validate()) {
                          nextPage();
                        }
                      } else if (controller.page == 1) {
                        if (formKey2.currentState!.validate()) {
                          nextPage();
                        }
                      } else if (controller.page == 2) {
                        if (formKey3.currentState!.validate()) {
                          nextPage();
                        }
                      } else if (controller.page == 3) {
                        if (formKey4.currentState!.validate()) {
                          nextPage();
                        }
                      }
                    },
                    child: const Text(
                      AppStrings.next,
                      //style: Theme.of(context).textTheme.bodySmall,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget fillProfile1() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.secondary),
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
        child: Form(
          key: formKey1,
          child: Column(
            children: [
              // Profile Image
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      backgroundColor: ColorManager.lightGrey,
                      radius: AppSizeWidth.s80,
                      child: Icon(
                        Icons.person,
                        size: AppSizeHeight.s120,
                        color: ColorManager.grey2,
                      )),
                  Container(
                    width: AppSizeWidth.s40,
                    height: AppSizeHeight.s40,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(AppSizeHeight.s16),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: AppSizeWidth.s25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // firstName
              DefaultTextFormField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.firstName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // secondName
              DefaultTextFormField(
                  controller: secondName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.secondName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // thirdName
              DefaultTextFormField(
                  controller: thirdName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.thirdName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // lastName
              DefaultTextFormField(
                  controller: lastName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.lastName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // nationalIdCard
              DefaultTextFormField(
                  controller: nationalIdCard,
                  keyboardType: TextInputType.number,
                  label: AppStrings.nationalIdCard,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // phone
              InternationalPhoneNumberInput(
                spaceBetweenSelectorAndTextField: AppSizeWidth.s0,
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: phone,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
            ],
          ),
        ),
      ),
    );
  }

  Widget fillProfile2() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.secondary),
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
        child: Form(
          key: formKey2,
          child: Column(
            children: [
              // dateOfBirth
              DefaultTextFormField(
                  controller: dateOfBirth,
                  keyboardType: TextInputType.none,
                  label: AppStrings.dateOfBirth,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateOfBirth.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // religion
              DefaultTextFormField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.firstName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // gender
              DefaultTextFormField(
                  controller: secondName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.secondName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // Marital status
              DefaultTextFormField(
                  controller: thirdName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.thirdName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // nationality
              DefaultTextFormField(
                  controller: lastName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.lastName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // blood type
              DefaultTextFormField(
                  controller: nationalIdCard,
                  keyboardType: TextInputType.number,
                  label: AppStrings.nationalIdCard,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // height
              DefaultTextFormField(
                  controller: nationalIdCard,
                  keyboardType: TextInputType.number,
                  label: AppStrings.nationalIdCard,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
              // weight
              DefaultTextFormField(
                  controller: dateOfBirth,
                  keyboardType: TextInputType.none,
                  label: AppStrings.dateOfBirth,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateOfBirth.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
            ],
          ),
        ),
      ),
    );
  }

  Widget fillProfile3() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.secondary),
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
        child: Form(
          key: formKey2,
          child: Column(
            children: [
              // streetName
              DefaultTextFormField(
                  controller: dateOfBirth,
                  keyboardType: TextInputType.none,
                  label: AppStrings.dateOfBirth,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateOfBirth.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // buildingNumber
              DefaultTextFormField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.firstName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // appartmentNumber
              DefaultTextFormField(
                  controller: secondName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.secondName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // city
              DefaultTextFormField(
                  controller: thirdName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.thirdName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // country
              DefaultTextFormField(
                  controller: lastName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.lastName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // fullAddress
              DefaultTextFormField(
                  controller: nationalIdCard,
                  keyboardType: TextInputType.number,
                  label: AppStrings.nationalIdCard,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // birthPlaceCity
              DefaultTextFormField(
                  controller: dateOfBirth,
                  keyboardType: TextInputType.none,
                  label: AppStrings.dateOfBirth,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateOfBirth.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // birthPlaceCountry
              DefaultTextFormField(
                  controller: nationalIdCard,
                  keyboardType: TextInputType.number,
                  label: AppStrings.nationalIdCard,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
            ],
          ),
        ),
      ),
    );
  }

  Widget fillProfile4() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.secondary),
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
        child: Form(
          key: formKey2,
          child: Column(
            children: [
              // job
              DefaultTextFormField(
                  controller: dateOfBirth,
                  keyboardType: TextInputType.none,
                  label: AppStrings.dateOfBirth,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateOfBirth.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobBuildingNumber
              DefaultTextFormField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.firstName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobStreetName
              DefaultTextFormField(
                  controller: secondName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.secondName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobCity
              DefaultTextFormField(
                  controller: thirdName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.thirdName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobCountry
              DefaultTextFormField(
                  controller: lastName,
                  keyboardType: TextInputType.name,
                  label: AppStrings.lastName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // jobFullAddress
              DefaultTextFormField(
                  controller: nationalIdCard,
                  keyboardType: TextInputType.number,
                  label: AppStrings.nationalIdCard,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
