unit VinylSourceStream;

interface

uses
  NodeJS.Stream;

function vinylSourceStream(filename: String): JReadWriteStream; external 'vinyl-source-stream.vinylSourceStream';



