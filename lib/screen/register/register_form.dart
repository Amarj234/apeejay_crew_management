import 'package:age_calculator/age_calculator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../commonfun/capitale.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonwidget/app_button.dart';
import '../commonwidget/costum_snackbar.dart';
import '../commonwidget/register_textfields.dart';
import '../commonwidget/textfield.dart';
import '../otp/otp_screen.dart';
import 'bloc/register_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.phone});
  final String phone;
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController indos = TextEditingController();
  TextEditingController dob = TextEditingController();
  String flag = "🇮🇳";
  String country = "+91";
  String date = "0";
  String years = "0";
  String month = "0";
  bool ageerror = false;
  String countryCode = "+91";

  DateTime mydob = DateTime.now();

  void ageCaculate(DateTime today, DateTime dob) {
    final duration = AgeCalculator.dateDifference(
      fromDate: dob,
      toDate: today,
    );
    date = duration.days.toString();
    years = duration.years.toString();
    month = duration.months.abs().toString();
    setState(() {
      if (duration.years < 18) {
        ageerror = true;
      } else {
        ageerror = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phone.text = widget.phone;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.formreg),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                // TODO: implement listener

                if (state is RegisterSuccess) {
                  if (state.res.status==true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpScreen(
                                  emailotp: state.res.data?.emailOtp.toString(),
                                  phoneotp: state.res.data?.otp.toString(),
                                  phone: phone.text,
                                  email: email.text,
                                  indos: indos.text,
                                  dob: mydob, name: state.res.data!.indosDetails!.name.toString(), passport: state.res.data!.indosDetails!.passportNo.toString(),
                                )));
                  } else {
                    //  Alert(message: 'Somthing Woring Please try again', shortDuration: true).show();
                  }
                }
              },
              builder: (context, state) {
                if (state is RegisterLoding) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is RegisterError) {
                  return Center(
                    child: Text(state.Error),
                  );
                } else {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Register Form",
                          style: style28w400b,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AutoSizeText(
                          "Fill up the form for complete your Registration",
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff545454)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFields(
                          bordercolor: const Color(0xffB5C6C4),
                          hint: 'Mobile Number',
                          mycon: phone, cuntryFun: (String? val) {
                           countryCode = val??"+91";

                        },
                        ),
                        if (state is RegisterfiedlsError) ...[
                          for (int i = 0;
                              i < state.Errors.errors!.phone!.length;
                              i++) ...[
                            Text(
                              state.Errors.errors!.phone![i],
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ],
                        const SizedBox(
                          height: 20,
                        ),
                        RegisterTextfields(
                          bordercolor: const Color(0xffB5C6C4),
                          mycon: email,
                          hint: "Email Address",
                          isvalid: 1,
                        ),
                        if (state is RegisterfiedlsError) ...[
                          for (int i = 0;
                              i < state.Errors.errors!.email!.length;
                              i++) ...[
                            Text(
                              state.Errors.errors!.email![i],
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ],
                        const SizedBox(
                          height: 20,
                        ),
                        RegisterTextfields(
                          inputFormatters: <TextInputFormatter>[
                            UpperCaseTextFormatter()
                          ],
                          bordercolor: const Color(0xffB5C6C4),
                          mycon: indos,
                          hint: "INDos Number",
                          isvalid: 3,
                        ),
                        if (state is RegisterfiedlsError) ...[
                          for (int i = 0;
                              i < state.Errors.errors!.indosNumber!.length;
                              i++) ...[
                            Text(
                              state.Errors.errors!.indosNumber![i],
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ],
                        const SizedBox(
                          height: 20,
                        ),
                        RegisterTextfields(
                          bordercolor: const Color(0xffB5C6C4),
                          myfun: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            mydob = pickedDate!;
                            dob.text =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            ageCaculate(DateTime.now(), pickedDate);
                          },
                          readonly: true,
                          isicon: true,
                          icon: AssetImages.dob,
                          mycon: dob,
                          hint: "DOB",
                          isvalid: 3,
                        ),
                        Container(
                            child: ageerror
                                ? const Text(
                                    "Please choose a Valid age",
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Container()),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myage("$years years"),
                            myage("$month months"),
                            myage("$date Day"),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AppButton(
                            width: 153,
                            hight: 49,
                            color: Colors.black,
                            myfun: () {
                              final isValid = _formKey.currentState!.validate();
                              if (!isValid) {
                                return;
                              }
                              if (indos.text.length == 8) {
                                context.read<RegisterBloc>().add(Register(
                                      dob: dob.text,
                                      indos: indos.text,
                                      email: email.text,
                                      phone: phone.text,
                                      cuntry: countryCode,
                                      context: context,
                                    ));
                              } else {
                                CostomSnackbar.show(context,
                                    "The indos number must be 8 characters.");
                              }
                            },
                            mystyle: style18w500w,
                            name: "REGISTER",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          )),
        ),
      ),
    );
  }

  Container myage(String age) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xffB5C6C4),
          )),
      child: Text(age),
    );
  }
}
