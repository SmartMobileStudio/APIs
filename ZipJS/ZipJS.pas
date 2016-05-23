unit ZipJS;

interface

uses
  ECMA.Date, W3C.File, W3C.TypedArray;

type
  JFileEntry = class external
  end;

  TZipOnReader = procedure(result: JUint8Array);
  TZipOnError = procedure(error: Variant);

  JReader = class external 'zip.Reader'
    size: Float;
    procedure init(callback: procedure; onerror: TZipOnError);
    procedure readUint8Array(index, _length: Float; callback: TZipOnReader); overload;
    procedure readUint8Array(index, _length: Float; callback: TZipOnReader;
      onerror: TZipOnError); overload;
  end;

  JTextReader = class external 'zip.TextReader'(JReader)
    constructor Create(text: String);
  end;

  JBlobReader = class external 'zip.BlobReader'(JReader)
    constructor Create(blob: JBlob);
  end;

  JData64URIReader = class external 'zip.Data64URIReader'(JReader)
    constructor Create(dataURI: String);
  end;

  JHttpReader = class external 'zip.HttpReader'(JReader)
    constructor Create(url: String);
  end;

  JWriter = class external 'zip.Writer'
    procedure init(callback: procedure); overload;
    procedure init(callback: procedure; onerror: TZipOnError); overload;
    procedure writeUint8Array(&array: JUint8Array; callback: procedure); overload;
    procedure writeUint8Array(&array: JUint8Array; callback: procedure; onerror: TZipOnError); overload;
    procedure getData(callback: procedure(data: Variant)); overload;
    procedure getData(callback: procedure(data: Variant); onerror: TZipOnError); overload;
  end;

  TZipOnProgressEvent = procedure(progress, total: Float);
  TZipOnGetData = procedure(result: Variant);


  JEntry = class external 'zip.Entry'
    filename: String;
    directory: Boolean;
    compressedSize: Float;
    uncompressedSize: Float;
    lastModDate: JDate;
    lastModDateRaw: Float;
    comment: String;
    crc32: Float;
    procedure getData(writer: JWriter; onend: TZipOnGetData); overload;
    procedure getData(writer: JWriter; onend: TZipOnGetData;
      onprogress: TZipOnProgressEvent); overload;
    procedure getData(writer: JWriter; onend: TZipOnGetData;
      onprogress: TZipOnProgressEvent; checkCrc32: Boolean); overload;
  end;

  JZipReader = class external 'ZipReader'
    procedure getEntries(callback: procedure(entries: array of JEntry));
    procedure close; overload;
    procedure close(callback: procedure); overload;
  end;

  JTextWriter = class external 'TextWriter'(JWriter)
    constructor Create(encoding: String);
  end;

  JBlobWriter = class external 'BlobWriter'(JWriter)
    constructor Create(contentType: String);
  end;

  JFileWriter = class external 'FileWriter'(JWriter)
    constructor Create(fileEntry: JFileEntry);
  end;

  JData64URIWriter = class external 'Data64URIWriter'(JWriter)
    constructor Create(mimeString: String);
  end;

  JWriteOptions = class external
    directory: Boolean; // nullable
    level: Float; // nullable
    comment: String; // nullable
    lastModDate: JDate; // nullable
    version: Float; // nullable
  end;

  JZipWriter = class external 'ZipWriter'
    procedure add(name: String; reader: JReader; onend: procedure); overload;
    procedure add(name: String; reader: JReader; onend: procedure;
      onprogress: TZipOnProgressEvent); overload;
    procedure add(name: String; reader: JReader; onend: procedure;
      onprogress: TZipOnProgressEvent; options: JWriteOptions); overload;
    procedure close(callback: procedure(result: Variant));
  end;

  TZipOnCreateReaderCallback = procedure(zipReader: JZipReader);
  TZipOnCreateWriterCallback = procedure(zipWriter: JZipWriter);

procedure createReader(reader: JReader; callback: TZipOnCreateReaderCallback); overload; external;
procedure createReader(reader: JReader; callback: TZipOnCreateReaderCallback;
  onerror: TZipOnError); overload; external;
procedure createWriter(writer: JWriter; callback: TZipOnCreateWriterCallback); overload; external;
procedure createWriter(writer: JWriter; callback: TZipOnCreateWriterCallback;
  onerror: TZipOnError); overload; external;
procedure createWriter(writer: JWriter; callback: TZipOnCreateWriterCallback;
  onerror: TZipOnError; dontDeflate: Boolean); overload; external;

var
  useWebWorkers external 'useWebWorkers': Boolean;
  workerScriptsPath external 'workerScriptsPath': String;
  workerScripts external 'workerScripts': record
    deflater: array of String; // nullable
    inflater: array of String; // nullable
  end;
