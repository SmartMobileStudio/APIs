unit Impress;

// Project: https://github.com/bartaz/impress.js
// Original TypeScript Definitions by: 
// Boris Yankov <https://github.com/borisyankov/>

interface

type
  JImpress = class external
    procedure init;
    function getStep(step: Variant): Variant;
    function goto(element: Variant): Variant; overload;
    function goto(element: Variant; duration: Float): Variant; overload;
    function prev: Variant;
    function next: Variant;
  end;

function Impress: JImpress; external 'Impress';
