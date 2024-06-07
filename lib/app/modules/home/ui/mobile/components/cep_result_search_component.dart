// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cep_aberto_app/app/modules/home/infra/models/cep_model.dart';

import 'text_component.dart';

class CepResultSearchComponent extends StatelessWidget {
  final CepModel item;
  const CepResultSearchComponent({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'UF',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  TextWidget(
                    item.uf ?? '-',
                    textInPrimaryColor: true,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Logradouro',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextWidget(
                      item.logradouro ?? '-',
                      textInPrimaryColor: true,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.withOpacity(0.7),
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Complemento',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextWidget(
                      item.complemento ?? '-',
                      textInPrimaryColor: true,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.withOpacity(0.7),
                          ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Bairro',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextWidget(
                      item.bairro ?? '-',
                      textInPrimaryColor: true,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.withOpacity(0.7),
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Localidade',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  TextWidget(
                    item.localidade ?? '-',
                    textInPrimaryColor: true,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'CEP',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextWidget(
                      item.cep ?? '-',
                      textInPrimaryColor: true,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.withOpacity(0.7),
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
