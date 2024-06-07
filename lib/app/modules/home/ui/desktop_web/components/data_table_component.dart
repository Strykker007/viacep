import 'package:cep_aberto_app/app/modules/home/presenter/controllers/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DataTableComponent extends StatelessWidget {
  const DataTableComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeStore store = Modular.get();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: DataTable(
              dataTextStyle: Theme.of(context).textTheme.headlineSmall,
              headingTextStyle: Theme.of(context).textTheme.headlineSmall,
              dividerThickness: 0.3,
              columns: [
                DataColumn(
                  label: Text(
                    'CEP',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Logradouro',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Complemento',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bairro',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Localidade',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'UF',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                ),
              ],
              rows: store.address.cep != null && store.address.cep!.isNotEmpty
                  ? [
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              store.address.uf ?? '-',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          DataCell(
                            Text(
                              store.address.logradouro ?? '-',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          DataCell(
                            Text(
                              store.address.complemento ?? '-',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          DataCell(
                            Text(
                              store.address.bairro ?? '-',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          DataCell(
                            Text(
                              store.address.localidade ?? '-',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          DataCell(
                            Text(
                              store.address.uf ?? '-',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ]
                  : store.addressList
                      .map(
                        (element) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                element.uf ?? '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            ),
                            DataCell(
                              Text(
                                element.logradouro ?? '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            ),
                            DataCell(
                              Text(
                                element.complemento ?? '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            ),
                            DataCell(
                              Text(
                                element.bairro ?? '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            ),
                            DataCell(
                              Text(
                                element.localidade ?? '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            ),
                            DataCell(
                              Text(
                                element.uf ?? '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
