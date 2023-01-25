import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({Key? key}) : super(key: key);

  @override
  _UploadWidgetState createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  bool isMediaUploading = false;
  FFLocalFile uploadedLocalFile = FFLocalFile(bytes: Uint8List.fromList([]));

  ApiCallResponse? uploadResponse;
  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
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
            'Upload Sample',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: AuthUserStreamWidget(
                  builder: (context) => Text(
                    currentUserDisplayName,
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      currentUserPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: TextFormField(
                  controller: textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Track Name',
                    hintText: 'Enter a name for your sample',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF102345),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF102345),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  final selectedFile =
                      await selectFile(allowedExtensions: ['mp3']);
                  if (selectedFile != null) {
                    setState(() => isMediaUploading = true);
                    FFLocalFile? selectedLocalFile;
                    try {
                      selectedLocalFile = FFLocalFile(
                        name: selectedFile.storagePath.split('/').last,
                        bytes: selectedFile.bytes,
                      );
                    } finally {
                      isMediaUploading = false;
                    }
                    if (selectedLocalFile != null) {
                      setState(() => uploadedLocalFile = selectedLocalFile!);
                    } else {
                      setState(() {});
                      return;
                    }
                  }

                  uploadResponse =
                      await FirebaseMusicManagerGroup.uploadSongCall.call(
                    upload: uploadedLocalFile,
                    song: textController!.text,
                    artist: currentUserDisplayName,
                    jwtToken: currentJwtToken,
                  );
                  if ((uploadResponse?.succeeded ?? true)) {
                    FFAppState().update(() {
                      FFAppState().songUploaded = true;
                      FFAppState().uploadedUrl =
                          FirebaseMusicManagerGroup.uploadSongCall.downloadUrl(
                        (uploadResponse?.jsonBody ?? ''),
                      );
                    });
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Uh oh'),
                          content: Text(FirebaseMusicManagerGroup.uploadSongCall
                              .error(
                                (uploadResponse?.jsonBody ?? ''),
                              )
                              .toString()),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  setState(() {});
                },
                text: 'Upload',
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
              if (FFAppState().songUploaded)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Here\'s what you uploaded',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              if (FFAppState().songUploaded)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: FlutterFlowAudioPlayer(
                    audio: Audio.network(
                      FFAppState().uploadedUrl,
                      metas: Metas(
                        id: 'sample3.mp3-v3o3mj1j',
                        title: textController!.text,
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
              if (FFAppState().songUploaded)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().songUploaded = false;
                      FFAppState().uploadedUrl = '';

                      context.goNamed('samplepool');
                    },
                    text: 'Sweet!',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
