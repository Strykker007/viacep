// DataTable(
//                       onSelectAll: (b) {
//                         updateAllPatient(b);
//                       },
//                       sortColumnIndex: 4,
//                       dataTextStyle: Theme.of(context).textTheme.headlineSmall,
//                       headingTextStyle:
//                           Theme.of(context).textTheme.headlineSmall,
//                       dividerThickness: 0.3,
//                       columns: [
//                         // ),
//                         DataColumn(
//                           label: Text(
//                             'Paciente',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Celular',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Data de entrada',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Data de alta',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ), // ),
//                         DataColumn(
//                           label: Text(
//                             'Motivo da alta',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Tel. do responsável',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Responsável',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Enviado',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                           ),
//                         ),
//                       ],
//                       rows: store.state.results!
//                           .map(
//                             (e) => DataRow(
//                               selected: e.selected!,
//                               onSelectChanged: (value) {
//                                 updatePatient(e);
//                               },
//                               cells: [
//                                 DataCell(
//                                   Tooltip(
//                                     message: Formatters.calcularIdade(
//                                       e.dt_nascimento!,
//                                     ),
//                                     child: Text(
//                                       e.nm_paciente ?? '-',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headlineSmall!
//                                           .copyWith(
//                                             fontSize: 12,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(
//                                     e.nr_celular != null
//                                         ? !numbersApproach
//                                                 .contains(e.nr_celular!)
//                                             ? e.nr_celular!
//                                             : '-'
//                                         : '-',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineSmall!
//                                         .copyWith(
//                                           fontSize: 12,
//                                         ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(
//                                     Formatters.formatarData(e.dt_entrada!),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineSmall!
//                                         .copyWith(
//                                           fontSize: 12,
//                                         ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(
//                                     Formatters.formatarData(e.dt_alta!),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineSmall!
//                                         .copyWith(
//                                           fontSize: 12,
//                                         ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Tooltip(
//                                     message: "Estabelencimento: " +
//                                         e.ds_estabelecimento! +
//                                         "\n" +
//                                         "Setor: " +
//                                         e.ds_setor_atendimento.toString(),
//                                     child: Text(
//                                       e.ds_motivo_alta ?? '-',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headlineSmall!
//                                           .copyWith(
//                                             fontSize: 12,
//                                           ),
//                                     ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(
//                                     e.nr_celular_responsavel != null
//                                         ? !numbersApproach.contains(
//                                                 e.nr_celular_responsavel!)
//                                             ? e.nr_celular_responsavel!
//                                             : '-'
//                                         : '-',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineSmall!
//                                         .copyWith(
//                                           fontSize: 12,
//                                         ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Text(
//                                     e.nm_responsavel ?? '-',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headlineSmall!
//                                         .copyWith(
//                                           fontSize: 12,
//                                         ),
//                                   ),
//                                 ),
//                                 DataCell(
//                                   Icon(
//                                     e.sms_enviado != null && e.sms_enviado!
//                                         ? Icons.check_circle
//                                         : Icons.remove_circle_outline_rounded,
//                                     color:
//                                         e.sms_enviado != null && e.sms_enviado!
//                                             ? Colors.green
//                                             : Colors.grey,
//                                     size: 20,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                           .toList(),
//                     ),