unit Google.Maps.InfoBubble;

interface

uses
  Google.Maps;

//google.maps.infobubble

type
  JInfoBubbleOptions = class external
    arrowPosition: Float; // nullable
    arrowSize: Float; // nullable
    arrowStyle: Float; // nullable
    backgroundColor: String; // nullable
    borderColor: String; // nullable
    borderRadius: Float; // nullable
    borderWidth: Float; // nullable
    disableAnimation: Boolean; // nullable
    disableAutoPan: Boolean; // nullable
    maxHeight: Float; // nullable
    maxWidth: Float; // nullable
    minHeight: Float; // nullable
    minWidth: Float; // nullable
    padding: Float; // nullable
    shadowStyle: Float; // nullable
  end;

  JInfoBubble = class external
    procedure close;
    function isOpen: Boolean;
    procedure open(map: JMap; marker: JMarker);
    function getPosition: JLatLng;
  end;


