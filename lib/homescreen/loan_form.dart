import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gimedhas_assignment/homescreen/loan_details.dart';
import 'package:gimedhas_assignment/homescreen/tractor_info.dart';
import 'package:gimedhas_assignment/local_storage.dart';
import 'package:gimedhas_assignment/models/currency_model.dart';
import 'package:gimedhas_assignment/models/products_model.dart';

class LoanForm extends StatefulWidget {
  LoanForm({this.currencyInfo, this.allProducts, this.index, super.key});
  CurrencyInfo? currencyInfo;
  AllProducts? allProducts;
  int? index;

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController confirmAccountController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController amountInUSDController = TextEditingController();
  GlobalKey<FormState> detailsKey = GlobalKey<FormState>();
  saveFormDetails({name,email,phonenumber,tractorname,price}){
    SecureStorage.writeData(name, "name");
    SecureStorage.writeData(email, "email");
    SecureStorage.writeData(phonenumber, "phonenumber");
    SecureStorage.writeData(tractorname, "tracorname");
    SecureStorage.writeData(price, "price");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Form(
              key: detailsKey,
              child: Column(
                children: [
                  textField(
                    giveHeight: 70,
                    fieldController: nameController,
                    hintText: "Enter Name",
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.black54,
                    lable: "Name",
                    labelColor: Colors.black54,
                    hintColor: Colors.black54,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    keyboardType: TextInputType.name,
                    onFieldEntry: (p0) {},
                    validatorfun: (p0) {
                      if (nameController.text == "") {
                        return "Field can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    giveHeight: 70,
                    fieldController: emailController,
                    lable: "Email Address",
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.black54,
                    hintText: "Enter Email",
                    labelColor: Colors.black54,
                    hintColor: Colors.black54,
                    keyboardType: TextInputType.emailAddress,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    onFieldEntry: (p0) {},
                    validatorfun: (p0) {
                      if (emailController.text == "") {
                        return "Field can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    giveHeight: 70,
                    fieldController: mobileController,
                    lable: "Mobile number",
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.black54,
                    hintText: " Enter Mobile number",
                    labelColor: Colors.black54,
                    hintColor: Colors.black54,
                    keyboardType: TextInputType.phone,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    onFieldEntry: (p0) {},
                    validatorfun: (p0) {
                      if (mobileController.text == "") {
                        return "Field can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    giveHeight: 70,
                    fieldController: accountController,
                    lable: "Account number",
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.black54,
                    hintText: "Enter Account number",
                    labelColor: Colors.black54,
                    hintColor: Colors.black54,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    onFieldEntry: (p0) {},
                    validatorfun: (p0) {
                      if (accountController.text == "") {
                        return "Field can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    giveHeight: 70,
                    fieldController: confirmAccountController,
                    lable: " Re-Enter Account number",
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.black54,
                    hintText: "Re-Enter Account number",
                    labelColor: Colors.black54,
                    hintColor: Colors.black54,
                    keyboardType: TextInputType.number,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    onFieldEntry: (p0) {},
                    validatorfun: (p0) {
                      if (accountController.text !=
                          confirmAccountController.text) {
                        return "Account number need to match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    isFieldReadOnly: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelAlwaysOnTop: widget.allProducts != null ? true : false,
                    fieldController: TextEditingController(),
                    lable: "Select Tractor",
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.black54,
                    labelColor: Colors.black54,
                    hintColor: Colors.black54,
                    onFieldEntry: null,
                    hintText:
                        widget.allProducts?.products?[widget.index!].title ??
                            "",
                    onFieldTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TractorInfo(currencyInfo: widget.currencyInfo),)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textField(
                        giveHeight: 50,
                        giveWidth: 150,
                        isFieldReadOnly: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        labelAlwaysOnTop:
                            widget.allProducts != null ? true : false,
                        fieldController: loanAmountController,
                        lable: "Loan amount",
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.black54,
                        hintText: widget.allProducts != null &&
                                widget.allProducts?.products != null
                            ? widget.allProducts!.products![widget.index!].price
                            : "",
                        labelColor: Colors.black54,
                        hintColor: Colors.black54,
                        keyboardType: TextInputType.number,
                        onFieldEntry: null,
                      ),
                      textField(
                        giveHeight: 50,
                        giveWidth: 150,
                        isFieldReadOnly: true,
                        fieldController: amountInUSDController,
                        lable: "Amount in USD",
                        labelAlwaysOnTop:
                            widget.allProducts != null ? true : false,
                        hintText: widget.allProducts != null &&
                                widget.allProducts?.products != null &&
                                widget.currencyInfo != null
                            ? "₹${double.parse(widget.allProducts!.products![widget.index!].price.split("\$").last.replaceAll(",", "")) * widget.currencyInfo!.indianRupee!.roundToDouble()}"
                            : "",
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.black54,
                        labelColor: Colors.black54,
                        hintColor: Colors.black54,
                        keyboardType: TextInputType.number,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        onFieldEntry: (p0) {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        print(nameController.text);
                        if (detailsKey.currentState!.validate()) {
                          saveFormDetails(name:nameController.text,phonenumber: mobileController.text,
                          email: emailController.text,price:
                                  "${double.parse(widget.allProducts!.products![widget.index!].price.split("\$").last.replaceAll(",", "")) * widget.currencyInfo!.indianRupee!.roundToDouble()}",
                             tractorname:widget.allProducts!.products![widget.index!].title       
                           );
                         
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoanDetails(
                              
                            );
                          }));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 12.0,
                          textStyle: const TextStyle(color: Colors.white)),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(
          {required TextEditingController fieldController,
          String? lable,
          bool? unfocusOnTapOutside,
          bool? labelAlwaysOnTop = false,
          required void Function(String)? onFieldEntry,
          bool autofocus = false,
          String? hintText,
          double lableTextSize = 16,
          double hintTextSize = 16,
          Color labelColor = Colors.transparent,
          Color hintColor = Colors.black,
          Color borderColor = Colors.transparent,
          double? giveHeight = 60,
          double? giveWidth,
          bool alignLabelasHint = false,
          Widget? suffixWidget,
          FontWeight? textWeight,
          BoxConstraints suffixConstraints = const BoxConstraints(
              minHeight: 0, minWidth: 0, maxHeight: 25, maxWidth: 30),
          EdgeInsetsGeometry contentPadding = const EdgeInsets.only(left: 5),
          Widget? prefixWidget,
          Text? giveLabel,
          FocusNode? fieldFocusNode,
          void Function()? onFieldTap,
          String? Function(String?)? validatorfun,
          int? fieldMaxLines = 1,
          bool isFieldReadOnly = false,
          Color textColor = Colors.black,
          double borderRadius = 12,
          TextInputType? keyboardType,
          double? cursorHeight,
          // double cursorWidth =3.0,
          Color? cursorColor,
          TextAlign textAlignment = TextAlign.start,
          Color backgroundColor = Colors.white,
          bool obscureText = false,
          TextCapitalization? textCapitalization}) =>
      Container(
        height: giveHeight,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        width: giveWidth,
        child: TextFormField(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          cursorHeight: cursorHeight,
          // cursorWidth: cursorWidth,
          keyboardType: keyboardType,
          cursorColor: Colors.black54,
          textAlign: textAlignment,
          obscureText: obscureText,
          readOnly: isFieldReadOnly,
          textInputAction: TextInputAction.newline,
          maxLines: fieldMaxLines,
          onTap: onFieldTap,
          validator: validatorfun,
          focusNode: fieldFocusNode,
          autofocus: false,
          onChanged: onFieldEntry,
          controller: fieldController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            isDense: false,
            contentPadding: contentPadding,
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
            suffixIconConstraints: suffixConstraints,
            floatingLabelBehavior: labelAlwaysOnTop == true
                ? FloatingLabelBehavior.always
                : alignLabelasHint
                    ? FloatingLabelBehavior.never
                    : FloatingLabelBehavior.auto,

            alignLabelWithHint: alignLabelasHint,
            labelStyle: TextStyle(color: labelColor, fontSize: lableTextSize),

            labelText: lable,
            hintText: hintText,
            hintStyle: TextStyle(color: hintColor, fontSize: hintTextSize),

            // hintText: giveHint,
            // labelText: giveLabel.toString(),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
          ),
          style: TextStyle(
            fontSize: hintTextSize,
            color: textColor,
            fontWeight: textWeight,
          ),
          onTapOutside: (event) {
            unfocusOnTapOutside == true
                ? FocusManager.instance.primaryFocus?.unfocus()
                : null;
          },
        ),
      );
}
