import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsampleWidget extends StatefulWidget {
  const NewsampleWidget({
    Key? key,
    this.downloadUrl,
    this.artist,
    this.title,
    this.audioPath,
  }) : super(key: key);

  final String? downloadUrl;
  final String? artist;
  final String? title;
  final String? audioPath;

  @override
  _NewsampleWidgetState createState() => _NewsampleWidgetState();
}

class _NewsampleWidgetState extends State<NewsampleWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          alignment: AlignmentDirectional(-0.05, 0),
          child: Text(
            'New Sample!',
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
              Align(
                alignment: AlignmentDirectional(-0.05, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                  child: Text(
                    widget.artist!,
                    style: FlutterFlowTheme.of(context).title2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: Text(
                  'just uploaded a track called',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: Text(
                  widget.title!,
                  style: FlutterFlowTheme.of(context).title2,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Text(
                  'Have a listen...',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: FlutterFlowAudioPlayer(
                  audio: Audio.network(
                    widget.audioPath!,
                    metas: Metas(
                      id: 'sample3.mp3-t1no1doy',
                    ),
                  ),
                  titleTextStyle:
                      FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                  playbackDurationTextStyle:
                      FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF9D9D9D),
                            fontSize: 12,
                          ),
                  fillColor: Color(0xFFEEEEEE),
                  playbackButtonColor:
                      FlutterFlowTheme.of(context).primaryColor,
                  activeTrackColor: Color(0xFF57636C),
                  elevation: 4,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Nah I\'m good',
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      color: Color(0xFFB4292D),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                  FFButtonWidget(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Tap the download button to open a browser tab where you  can download the sample. Unfortunately, until the automation is fully deployed, you will still need to go to the sample pool and claim this track manually so that multiple producers don\'t end up downloading it. That\'s in the pipe for 2.0!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 10000),
                          backgroundColor: Color(0x00000000),
                          action: SnackBarAction(
                            label: 'Download',
                            textColor: Color(0x00000000),
                            onPressed: () async {
                              await launchURL(widget.downloadUrl!);
                            },
                          ),
                        ),
                      );
                    },
                    text: 'Gimme that!',
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      color: Color(0xFF20A944),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
            ],
          ),
        ),
      ),
    );
  }
}
