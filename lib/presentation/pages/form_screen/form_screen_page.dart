import 'package:flutter/material.dart';
import 'package:flutter_ngirit/domain/transaction_domain.dart';
import 'package:flutter_ngirit/presentation/misc/app_strings.dart';
import 'package:flutter_ngirit/presentation/pages/form_screen/form_screen_controller.dart';
import 'package:flutter_ngirit/presentation/widgets/common_button.dart';
import 'package:flutter_ngirit/presentation/widgets/common_date_input.dart';
import 'package:flutter_ngirit/presentation/widgets/common_dropdown_input.dart';
import 'package:flutter_ngirit/presentation/widgets/commont_text_input.dart';
import 'package:flutter_ngirit/presentation/widgets/common_modal.dart';
import 'package:provider/provider.dart';

import '../../misc/app_colors.dart';

class FormScreenPage extends StatefulWidget {
  FormScreenPage({super.key, this.transaction});

  TransactionDomain? transaction;

  @override
  State<FormScreenPage> createState() => _FormScreenPageState();
}

class _FormScreenPageState extends State<FormScreenPage> {
  late FormScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = context.read<FormScreenController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<FormScreenController>(
          builder: (context, value, child) {
            return ListView(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 67,
              ),
              children: [
                CommonTextInput(
                  labelText: 'Nominal',
                  placeholder: 'Harga',
                  controller: _controller.nominalTextController,
                  onChanged: (value) {
                    _controller.validateNominal();
                  },
                  withBorderBottom: true,
                  withAddon: true,
                  addonText: 'Rp',
                  isNumber: true,
                ),
                const SizedBox(height: 20),
                CommonDropdownInput(
                  labelText: 'Kategori',
                  placeholder: 'Select',
                  data: _controller.categoryData,
                  onChanged: (value) {
                    _controller.validateCategory(value ?? '');
                  },
                ),
                const SizedBox(height: 20),
                CommonDateInput(
                  labelText: 'Tanggal',
                  placeholder: 'Pilih Tanggal',
                  value: _controller.dateValue,
                  onChanged: (value) {
                    _controller.validateDate(value);
                  },
                ),
                const SizedBox(height: 20),
                CommonTextInput(
                  labelText: 'Keterangan',
                  placeholder: 'keterangan produk',
                  controller: _controller.descriptionTextController,
                  onChanged: (value) {
                    _controller.validateDescription();
                  },
                  withBorderBottom: true,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(
                      text: 'Simpan',
                      textColor: Colors.white,
                      backgroundColor: lightBlue,
                      onPressed: () {
                        _controller.handleSubmitButton().then((value) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CommonModal(
                                image: '${AppStrings.imagePath}img_success.png',
                                message: 'Transaksi  Berhasil Tersimpan',
                              );
                            },
                          );
                        }).onError((error, stackTrace) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CommonModal(
                                image: '${AppStrings.imagePath}img_failed.png',
                                message: 'Transaksi Gagal Tersimpan',
                              );
                            },
                          );
                        });
                      },
                      width: 114,
                      height: 56,
                      isEnabled: _controller.isBtnEnabled(),
                    ),
                    Visibility(
                      visible: widget.transaction != null,
                      child: CommonButton(
                        text: 'Hapus',
                        textColor: Colors.white,
                        backgroundColor: colorRed,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CommonModal(
                                image: '${AppStrings.imagePath}img_success.png',
                                message: 'Transaksi  Berhasil Tersimpan',
                              );
                            },
                          );
                        },
                        width: 114,
                        height: 56,
                        isEnabled: true,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
