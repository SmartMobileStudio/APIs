unit GulpSort;

interface

uses
  NodeJS.Stream, GulpUtil;

type
  TIComparatorFunction = function(file1, file2: JFile): Integer;

  JIOptions = class external
    comparator: TIComparatorFunction; // nullable
    asc: Boolean; // nullable
  end;

function gulpSort: JReadWriteStream; overload; external 'gulp-sort.gulpSort';
function gulpSort(comparator: TIComparatorFunction): JReadWriteStream; overload; external 'gulp-sort.gulpSort';
function gulpSort(options: JIOptions): JReadWriteStream; overload; external 'gulp-sort.gulpSort';



