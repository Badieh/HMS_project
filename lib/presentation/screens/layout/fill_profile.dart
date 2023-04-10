import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:hospital/presentation/components/components.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/font_manager.dart';
import 'package:hospital/presentation/resources/strings_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';
import 'package:hospital/presentation/screens/layout/home.dart';
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

  bool _isMale = true;
  MaritalStatus _maritalStatus = MaritalStatus.single;

  final TextEditingController nationality = TextEditingController();

  final List<String> _bloodTypes = <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  String? _bloodType;

  late String nationalitty;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double _height = 170.0;
  double _weight = 80;

  final TextEditingController streetName = TextEditingController();

  final TextEditingController appartmentNumber = TextEditingController();

  final TextEditingController buildingNumber = TextEditingController();
  late String addressCountry;
  String? addressState;
  String? addressCity;
  late String birthCountry;
  String? birthState;
  String? birthCity;

  final TextEditingController job = TextEditingController();
  final TextEditingController jobBuildingNumber = TextEditingController();
  final TextEditingController jobStreetName = TextEditingController();
  late String jobCountry;
  String? jobState;
  String? jobCity;

  @override
  void initState() {
    dateOfBirth.text = ""; //set the initial value of text field
    //bloodType = bloodTypes.first;
    heightController.text = _height.toString();
    weightController.text = _weight.toString();

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                //pageSnapping: false,
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
                      // if (controller.page == 0) {
                      //   if (formKey1.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // } else if (controller.page == 1) {
                      //   if (formKey2.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // } else if (controller.page == 2) {
                      //   if (formKey3.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // } else if (controller.page == 3) {
                      //   if (formKey4.currentState!.validate()) {
                      //     nextPage();
                      //   }
                      // }
                      if (controller.page == 0) {

                          nextPage();

                      } else if (controller.page == 1) {
                          nextPage();

                      } else if (controller.page == 2) {
                          nextPage();

                      } else if (controller.page == 3) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Screen(),));

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.secondary),
        borderRadius: BorderRadius.circular(AppPadding.p20),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Profile Image
              SizedBox(height: MediaQuery.of(context).size.height / 45),

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
              SizedBox(height: MediaQuery.of(context).size.height / 40),

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
              SizedBox(height: MediaQuery.of(context).size.height / 40),

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
              SizedBox(height: MediaQuery.of(context).size.height / 40),

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
              SizedBox(height: MediaQuery.of(context).size.height / 40),

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
              SizedBox(height: MediaQuery.of(context).size.height / 40),

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
              SizedBox(height: MediaQuery.of(context).size.height / 40),

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
              SizedBox(height: MediaQuery.of(context).size.height / 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget fillProfile2() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.secondary),
        borderRadius: BorderRadius.circular(AppPadding.p20),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // dateOfBirth
              SizedBox(height: MediaQuery.of(context).size.height / 45),

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
                  controller: religion,
                  keyboardType: TextInputType.text,
                  label: AppStrings.religion,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validator;
                    }
                  },
                  onFieldSubmitted: (value) {}),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // blood type
              DropdownButtonFormField<String>(
                hint: Text('Blood type'),
                value: _bloodType,
                icon: const Icon(Icons.bloodtype_outlined),
                isExpanded: true,
                elevation: 16,
                //style: TextStyle(color: ColorManager.primary),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _bloodType = value!;
                  });
                },
                items:
                    _bloodTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // gender
              Text(
                AppStrings.gender,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: FontSize.s18),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMale = true;
                      });
                    },
                    child: Container(
                      width: AppSizeWidth.s90,
                      height: AppSizeHeight.s80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeWidth.s10),
                        border: Border.all(
                            color: _isMale
                                ? ColorManager.primary
                                : ColorManager.grey),
                        color: _isMale
                            ? ColorManager.secondary
                            : ColorManager.lightGrey,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.boy,
                              size: AppSizeHeight.s60,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              AppStrings.male,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMale = false;
                      });
                    },
                    child: Container(
                      width: AppSizeWidth.s90,
                      height: AppSizeHeight.s80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeWidth.s10),
                        border: Border.all(
                            color: _isMale
                                ? ColorManager.grey
                                : ColorManager.primary),
                        color: _isMale
                            ? ColorManager.lightGrey
                            : ColorManager.secondary,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.girl,
                              size: AppSizeHeight.s60,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              AppStrings.female,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // Marital status
              Text(
                AppStrings.maritalStatus,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: FontSize.s18),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _maritalStatus = MaritalStatus.single;
                      });
                    },
                    child: Container(
                      width: AppSizeWidth.s70,
                      height: AppSizeHeight.s25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeWidth.s10),
                        border: Border.all(
                            color: _maritalStatus == MaritalStatus.single
                                ? ColorManager.primary
                                : ColorManager.lightGrey),
                        color: _maritalStatus == MaritalStatus.single
                            ? ColorManager.secondary
                            : ColorManager.lightGrey,
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.single,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: FontSize.s15),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _maritalStatus = MaritalStatus.married;
                      });
                    },
                    child: Container(
                      width: AppSizeWidth.s70,
                      height: AppSizeHeight.s25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeWidth.s10),
                        border: Border.all(
                            color: _maritalStatus == MaritalStatus.married
                                ? ColorManager.primary
                                : ColorManager.lightGrey),
                        color: _maritalStatus == MaritalStatus.married
                            ? ColorManager.secondary
                            : ColorManager.lightGrey,
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.married,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: FontSize.s15),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _maritalStatus = MaritalStatus.divorced;
                      });
                    },
                    child: Container(
                      width: AppSizeWidth.s70,
                      height: AppSizeHeight.s25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeWidth.s10),
                        border: Border.all(
                            color: _maritalStatus == MaritalStatus.divorced
                                ? ColorManager.primary
                                : ColorManager.lightGrey),
                        color: _maritalStatus == MaritalStatus.divorced
                            ? ColorManager.secondary
                            : ColorManager.lightGrey,
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.divorced,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: FontSize.s15),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _maritalStatus = MaritalStatus.widow;
                      });
                    },
                    child: Container(
                      width: AppSizeWidth.s70,
                      height: AppSizeHeight.s25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeWidth.s10),
                        border: Border.all(
                            color: _maritalStatus == MaritalStatus.widow
                                ? ColorManager.primary
                                : ColorManager.lightGrey),
                        color: _maritalStatus == MaritalStatus.widow
                            ? ColorManager.secondary
                            : ColorManager.lightGrey,
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.widowed,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: FontSize.s15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 45),

              // height
              Row(
                children: [
                  Text(
                    AppStrings.height,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p8),
                        width: AppSizeWidth.s60,
                        height: AppSizeHeight.s25,
                        child: DefaultTextFormField(
                            controller: heightController,
                            keyboardType: TextInputType.number,
                            label: '',
                            validator: (value) {},
                            onFieldSubmitted: (value) {
                              setState(() {
                                _height =
                                    double.tryParse(heightController.text)!;
                              });
                            }),
                      ),
                      Text(
                        AppStrings.cm,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Slider(
                  min: 0,
                  max: 250,
                  value: _height,
                  onChanged: (value) {
                    setState(() {
                      _height = value;
                      heightController.text = _height.toStringAsFixed(1);
                    });
                  }),

              // weight
              Row(
                children: [
                  Text(
                    AppStrings.weight,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s18),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p8),
                        width: AppSizeWidth.s60,
                        height: AppSizeHeight.s25,
                        child: DefaultTextFormField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            label: '',
                            validator: (value) {},
                            onFieldSubmitted: (value) {
                              setState(() {
                                _weight =
                                    double.tryParse(weightController.text)!;
                              });
                            }),
                      ),
                      Text(
                        AppStrings.kg,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Slider(
                  min: 1,
                  max: 250,
                  value: _weight,
                  onChanged: (value) {
                    setState(() {
                      _weight = value;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget fillProfile3() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.secondary),
        borderRadius: BorderRadius.circular(AppPadding.p20),
      ),
      child: Form(
        key: formKey3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // nationality
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            Text(
              AppStrings.nationality,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: FontSize.s18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            CSCPicker(
              //countryDropdownLabel: 'Nationality',
              showStates: false,
              //defaultCountry: CscCountry.Egypt,

              onCountryChanged: (value) {
                setState(() {
                  nationalitty = value;
                });
              },
              onStateChanged: (value) {},
              onCityChanged: (value) {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // appartmentNumber
            Text(
              AppStrings.address,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: FontSize.s18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            DefaultTextFormField(
                controller: appartmentNumber,
                keyboardType: TextInputType.number,
                label: AppStrings.appartmentNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.validator;
                  }
                },
                onFieldSubmitted: (value) {}),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // buildingNumber
            DefaultTextFormField(
                controller: buildingNumber,
                keyboardType: TextInputType.number,
                label: AppStrings.buildingNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.validator;
                  }
                },
                onFieldSubmitted: (value) {}),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // streetName
            DefaultTextFormField(
                controller: streetName,
                keyboardType: TextInputType.name,
                label: AppStrings.streetName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.validator;
                  }
                },
                onFieldSubmitted: (value) {}),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // city  / state / country
            CSCPicker(
              //countryDropdownLabel: 'Count',
              //defaultCountry: CscCountry.Egypt,

              onCountryChanged: (value) {
                setState(() {
                  addressCountry = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  addressState = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  addressCity = value;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
          ],
        ),
      ),
    );
  }

  Widget fillProfile4() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.secondary),
        borderRadius: BorderRadius.circular(AppPadding.p20),
      ),
      child: Form(
        key: formKey4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // birthPlaceCity / birthPlaceState  /birthPlaceCountry
            SizedBox(height: MediaQuery.of(context).size.height / 70),

            Text(
              AppStrings.birthAddress,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: FontSize.s18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            CSCPicker(
              // countryDropdownLabel: 'Nationality',
              // showStates: false,
              //defaultCountry: CscCountry.Egypt,

              onCountryChanged: (value) {
                setState(() {
                  birthCountry = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  birthState = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  birthCity = value;
                });
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // job
            Text(
              AppStrings.jobDetails,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: FontSize.s18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 45),
            DefaultTextFormField(
                controller: job,
                keyboardType: TextInputType.text,
                label: AppStrings.job,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.validator;
                  }
                },
                onFieldSubmitted: (value) {}),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // jobBuildingNumber
            DefaultTextFormField(
                controller: jobBuildingNumber,
                keyboardType: TextInputType.number,
                label: AppStrings.jobBuildingNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.validator;
                  }
                },
                onFieldSubmitted: (value) {}),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // jobStreetName
            DefaultTextFormField(
                controller: jobStreetName,
                keyboardType: TextInputType.name,
                label: AppStrings.jobStreetName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.validator;
                  }
                },
                onFieldSubmitted: (value) {}),
            SizedBox(height: MediaQuery.of(context).size.height / 45),

            // jobCity /jobState  /jobCountry
            CSCPicker(
              onCountryChanged: (value) {
                setState(() {
                  jobCountry = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  jobState = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  jobCity = value;
                });
              },
            ),

            SizedBox(height: MediaQuery.of(context).size.height / 45),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum MaritalStatus {
  single,
  married,
  divorced,
  widow,
}
