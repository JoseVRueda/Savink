import '/backend/backend.dart';
import '/components/congratulation_dialog/congratulation_dialog_widget.dart';
import '/components/error_amount/error_amount_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'action_sheet_pay_model.dart';
export 'action_sheet_pay_model.dart';

class ActionSheetPayWidget extends StatefulWidget {
  const ActionSheetPayWidget({
    super.key,
    required this.budgetIndex,
    required this.oldpay,
    required this.amount,
    required this.petIndex,
  });

  final DocumentReference? budgetIndex;
  final double? oldpay;
  final double? amount;
  final DocumentReference? petIndex;

  @override
  State<ActionSheetPayWidget> createState() => _ActionSheetPayWidgetState();
}

class _ActionSheetPayWidgetState extends State<ActionSheetPayWidget> {
  late ActionSheetPayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionSheetPayModel());

    _model.amountTextController ??= TextEditingController();
    _model.amountFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Escribir el monto a abonar',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            SizedBox(
              width: 250.0,
              child: TextFormField(
                controller: _model.amountTextController,
                focusNode: _model.amountFocusNode,
                autofocus: false,
                textInputAction: TextInputAction.next,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  hintText: '\$ 0.000',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                cursorColor: FlutterFlowTheme.of(context).primary,
                validator:
                    _model.amountTextControllerValidator.asValidator(context),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).secondary,
                    FlutterFlowTheme.of(context).primary
                  ],
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(1.0, 0.0),
                  end: const AlignmentDirectional(-1.0, 0),
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    if (widget.oldpay !=
                        valueOrDefault<double>(
                          functions.sumamount(
                              widget.oldpay!,
                              double.parse(_model.amountTextController.text),
                              widget.amount!),
                          0.0,
                        )) {
                      await widget.budgetIndex!.update(createBudgetRecordData(
                        payedAmount: functions.sumamount(
                            widget.oldpay!,
                            double.parse(_model.amountTextController.text),
                            widget.amount!),
                      ));

                      await widget.petIndex!.update({
                        ...mapToFirestore(
                          {
                            'progression': FieldValue.increment(
                                functions.progression(
                                    double.parse(
                                        _model.amountTextController.text),
                                    widget.amount!)),
                            'coins': FieldValue.increment(functions.coins(
                                double.parse(_model.amountTextController.text),
                                widget.amount!)),
                          },
                        ),
                      });
                      Navigator.pop(context);
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: CongratulationDialogWidget(
                              coins: functions.coins(
                                  double.parse(
                                      _model.amountTextController.text),
                                  widget.amount!),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    } else {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: const ErrorAmountWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    }
                  },
                  text: 'Abonar',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0x00FFFFFF),
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Cancelar',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
