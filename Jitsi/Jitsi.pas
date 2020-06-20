unit Jitsi;

interface

uses
  W3C.DOM4, W3C.Html5;

type
  JJitsiConfig = class external
    startWithAudioMuted: Boolean;
  end;

  JJitsiInterfaceConfig = class external
    filmStripOnly: Boolean;
  end;

  JJitsiInterfaceUserInfo = class external
    email: String;
    displayName: String;
  end;

  JJitsiInterfaceDevices = class external
    email: String;
    displayName: String;
  end;

  JJitsiOptions = class external
    roomName: String;
    width: String;
    height: String;
    parentNode: JHTMLElement;
    configOverwrite: JJitsiConfig;
    interfaceConfigOverwrite: JJitsiInterfaceConfig;
    noSSL: Boolean;
    jwt: Variant;
(*
    onload: (optional) handler for the iframe onload event.
    invitees: (optional) Array of objects containing information about new participants that will be invited in the call.
*)
    devices: JJitsiInterfaceDevices;
    userInfo: JJitsiInterfaceUserInfo;
  end;

  JJitsiAPI = class external 'JitsiMeetExternalAPI'
  public
    constructor Create; overload;
    constructor Create(Domain: String); overload;
    constructor Create(Domain: String; Options: JJitsiOptions); overload;

    procedure getAvailableDevices;
    procedure getCurrentDevices;
    procedure isDeviceChangeAvailable;
    procedure isDeviceListAvailable;
    procedure isMultipleAudioInputSupported;
    procedure setAudioInputDevice;
    procedure setAudioOutputDevice;
    procedure setVideoInputDevice;

    procedure executeCommand(command: String; argument: String); overload;
    procedure executeCommand(command: String; arguments: Variant); overload;

    function getNumberOfParticipants: Integer;

    function getAvatarURL(participantId: Variant): String;
    function getDisplayName(participantId: Variant): String;
    function getEmail(participantId: Variant): String;

    procedure getIFrame;

    procedure isAudioMuted;
    procedure isVideoMuted;

    procedure isAudioAvailable;
    procedure isVideoAvailable;

    procedure invite;

    procedure dispose;
  end;

implementation



end.
