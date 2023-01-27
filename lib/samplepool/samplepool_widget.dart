import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SamplepoolWidget extends StatefulWidget {
  const SamplepoolWidget({Key? key}) : super(key: key);

  @override
  _SamplepoolWidgetState createState() => _SamplepoolWidgetState();
}

class _SamplepoolWidgetState extends State<SamplepoolWidget> {
  ApiCallResponse? claimResponse;
  ApiCallResponse? samples;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      samples = await FirebaseMusicManagerGroup.getAllSamplesCall.call(
        jwtToken: currentJwtToken,
      );
      if ((samples?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().samples = FirebaseMusicManagerGroup.getAllSamplesCall
              .samples(
                (samples?.jsonBody ?? ''),
              )!
              .toList();
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Bummer!'),
              content: Text(FirebaseMusicManagerGroup.getAllSamplesCall
                  .error(
                    (samples?.jsonBody ?? ''),
                  )
                  .toString()
                  .toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Sample Pool',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        final sampleList = FFAppState().samples.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: sampleList.length,
                          itemBuilder: (context, sampleListIndex) {
                            final sampleListItem = sampleList[sampleListIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 10),
                                    child: Text(
                                      getJsonField(
                                        sampleListItem,
                                        r'''$.artist''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 10),
                                    child: FlutterFlowAudioPlayer(
                                      audio: Audio.network(
                                        getJsonField(
                                          sampleListItem,
                                          r'''$.url''',
                                        ),
                                        metas: Metas(
                                          id: 'sample3.mp3-5z64poe9',
                                          title: getJsonField(
                                            sampleListItem,
                                            r'''$.title''',
                                          ).toString(),
                                        ),
                                      ),
                                      titleTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                      playbackDurationTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF9D9D9D),
                                                fontSize: 12,
                                              ),
                                      fillColor: Color(0xFFEEEEEE),
                                      playbackButtonColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      activeTrackColor: Color(0xFF57636C),
                                      elevation: 4,
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      claimResponse =
                                          await FirebaseMusicManagerGroup
                                              .claimSampleCall
                                              .call(
                                        claimant: currentUserDisplayName,
                                        artist: getJsonField(
                                          sampleListItem,
                                          r'''$.artist''',
                                        ).toString(),
                                        song: getJsonField(
                                          sampleListItem,
                                          r'''$.title''',
                                        ).toString(),
                                      );
                                      if ((claimResponse?.succeeded ?? true)) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('It\'s Yours!'),
                                              content: Text(
                                                  FirebaseMusicManagerGroup
                                                      .claimSampleCall
                                                      .success(
                                                        (claimResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString()),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Dope'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Something Went Wrong...'),
                                              content: Text(
                                                  FirebaseMusicManagerGroup
                                                      .claimSampleCall
                                                      .error(
                                                        (claimResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString()),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ugh. Fine.'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text: 'Claim',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: Color(0xFF20A944),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('upload');
                  },
                  text: 'Upload Track',
                  options: FFButtonOptions(
                    width: 150,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await signOut();

                    context.goNamedAuth('Login', mounted);
                  },
                  text: 'Sign Out',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
