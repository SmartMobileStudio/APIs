unit Mongodb;

interface

uses
  ECMA.Date, NodeJS.core;

type
  JCursor = class;

  JSocketOptions = class external
    timeout: Float; // nullable
    noDelay: Boolean; // nullable
    keepAlive: Float; // nullable
    encoding: String; // nullable
  end;

  JServerOptions = class external
    auto_reconnect: Boolean; // nullable
    poolSize: Float; // nullable
    socketOptions: Variant; // nullable
  end;

  JPKFactory = class external
    counter: Float;
    createPk: function: Float;
  end;

  JDbCreateOptions = class external
    w: Variant; // nullable
    wtimeout: Float; // nullable
    fsync: Boolean; // nullable
    journal: Boolean; // nullable
    readPreference: String; // nullable
    native_parser: Boolean; // nullable
    forceServerObjectId: Boolean; // nullable
    pkFactory: JPKFactory; // nullable
    serializeFunctions: Boolean; // nullable
    raw: Boolean; // nullable
    recordQueryStats: Boolean; // nullable
    retryMiliSeconds: Float; // nullable
    numberOfRetries: Float; // nullable
    logger: JObject; // nullable
    slaveOk: Float; // nullable
    promoteLongs: Boolean; // nullable
  end;

  JServer = class external 'mongodb.Server'
    constructor Create(host: String; port: Float; opts: JServerOptions);
    function connect: Variant;
  end;

  JReadPreference = class external 'mongodb.ReadPreference'
    PRIMARY: String;
    PRIMARY_PREFERRED: String;
    SECONDARY: String;
    SECONDARY_PREFERRED: String;
    NEAREST: String;
  end;

  JCollectionCreateOptions = class external
    readPreference: String; // nullable
    slaveOk: Boolean; // nullable
    serializeFunctions: Boolean; // nullable
    raw: Boolean; // nullable
    pkFactory: JPKFactory; // nullable
  end;

  JCollStats = class external
    ns: String;
    count: Float;
    size: Float;
    avgObjSize: Float;
    storageSize: Float;
    numExtents: Float;
    nindexes: Float;
    lastExtentSize: Float;
    paddingFactor: Float;
    flags: Float;
    totalIndexSize: Float;
    indexSizes: record
      _id_: Float;
      username: Float;
    end;
  end;

  JMapReduceOptions = class external
    out: JObject; // nullable
    query: JObject; // nullable
    sort: JObject; // nullable
    limit: Float; // nullable
    keeptemp: Boolean; // nullable
    finalize: Variant; // nullable
    scope: JObject; // nullable
    jsMode: Boolean; // nullable
    verbose: Boolean; // nullable
    readPreference: String; // nullable
  end;

  JIndexOptions = class external
    w: Variant; // nullable
    wtimeout: Float; // nullable
    fsync: Boolean; // nullable
    journal: Boolean; // nullable
    unique: Boolean; // nullable
    sparse: Boolean; // nullable
    background: Boolean; // nullable
    dropDups: Boolean; // nullable
    min: Float; // nullable
    max: Float; // nullable
    v: Float; // nullable
    expireAfterSeconds: Float; // nullable
    name: String; // nullable
  end;

  JCollectionFindOptions = class external
    limit: Float; // nullable
    sort: Variant; // nullable
    fields: JObject; // nullable
    skip: Float; // nullable
    hint: JObject; // nullable
    explain: Boolean; // nullable
    snapshot: Boolean; // nullable
    timeout: Boolean; // nullable
    tailtable: Boolean; // nullable
    tailableRetryInterval: Float; // nullable
    numberOfRetries: Float; // nullable
    awaitdata: Boolean; // nullable
    oplogReplay: Boolean; // nullable
    exhaust: Boolean; // nullable
    batchSize: Float; // nullable
    returnKey: Boolean; // nullable
    maxScan: Float; // nullable
    min: Float; // nullable
    max: Float; // nullable
    showDiskLoc: Boolean; // nullable
    comment: String; // nullable
    raw: Boolean; // nullable
    readPreference: String; // nullable
    partial: Boolean; // nullable
  end;

  JMongoCollectionOptions = class external
    safe: Variant; // nullable
    serializeFunctions: Variant; // nullable
    strict: Boolean; // nullable
    raw: Boolean; // nullable
    pkFactory: Variant; // nullable
    readPreference: String; // nullable
  end;

  JCursorStream = class external 'mongodb.CursorStream'
    constructor Create(cursor: JCursor);
    function pause: Variant;
    function resume: Variant;
    function destroy: Variant;
  end;

  JCursor = class external 'mongodb.Cursor'
    function rewind: JCursor;
    procedure toArray; overload;
    procedure toArray(callback: function(err: JError; results: array of Variant): Variant); overload;
    procedure each; overload;
    procedure each(callback: procedure(err: JError; item: Variant)); overload;
    procedure count(applySkipLimit: Boolean); overload;
    procedure count(applySkipLimit: Boolean; callback: procedure(err: JError; count: Float)); overload;
    function sort(keyOrList: Variant): JCursor; overload;
    function sort(keyOrList: Variant; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function sort(keyOrList: String; direction: String; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function limit(limit: Float): JCursor; overload;
    function limit(limit: Float; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function setReadPreference(preference: String): JCursor; overload;
    function setReadPreference(preference: String; callback: JFunction): JCursor; overload;
    function skip(skip: Float): JCursor; overload;
    function skip(skip: Float; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function batchSize(batchSize: Float): JCursor; overload;
    function batchSize(batchSize: Float; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    procedure nextObject; overload;
    procedure nextObject(callback: procedure(err: JError; doc: Variant)); overload;
    procedure explain; overload;
    procedure explain(callback: procedure(err: JError; result: Variant)); overload;
    function stream: JCursorStream;
    procedure close; overload;
    procedure close(callback: procedure(err: JError; result: Variant)); overload;
    function isClosed: Boolean;
    INIT: Float;
    OPEN: Float;
    CLOSED: Float;
    GET_MORE: Float;
  end;

  JCollection = class external
    constructor CreateJCollection;
    procedure insert(query: Variant); overload;
    procedure insert(query: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure insert(query: Variant; options: record
      safe: Variant; // nullable
      continueOnError: Boolean; // nullable
      keepGoing: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
    end); overload;
    procedure insert(query: Variant; options: record
      safe: Variant; // nullable
      continueOnError: Boolean; // nullable
      keepGoing: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure insertOne(doc: Variant); overload;
    procedure insertOne(doc: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure insertOne(doc: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
      forceServerObjectId: Boolean; // nullable
    end); overload;
    procedure insertOne(doc: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
      forceServerObjectId: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure insertMany(docs: Variant); overload;
    procedure insertMany(docs: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure insertMany(docs: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
      forceServerObjectId: Boolean; // nullable
    end); overload;
    procedure insertMany(docs: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
      forceServerObjectId: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure remove(selector: JObject); overload;
    procedure remove(selector: JObject; callback: procedure(err: JError; result: Variant)); overload;
    procedure remove(selector: JObject; options: record
      safe: Variant; // nullable
      single: Boolean; // nullable
    end); overload;
    procedure remove(selector: JObject; options: record
      safe: Variant; // nullable
      single: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure deleteOne(filter: Variant); overload;
    procedure deleteOne(filter: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure deleteOne(filter: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end); overload;
    procedure deleteOne(filter: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure deleteMany(filter: Variant); overload;
    procedure deleteMany(filter: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure deleteMany(filter: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end); overload;
    procedure deleteMany(filter: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure rename(newName: String); overload;
    procedure rename(newName: String; callback: procedure(err: JError; result: Variant)); overload;
    procedure save(doc: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure save(doc: Variant; options: record
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure update(selector: JObject; document: Variant); overload;
    procedure update(selector: JObject; document: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure update(selector: JObject; document: Variant; options: record
      safe: Boolean; // nullable
      upsert: Variant; // nullable
      multi: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
    end); overload;
    procedure update(selector: JObject; document: Variant; options: record
      safe: Boolean; // nullable
      upsert: Variant; // nullable
      multi: Boolean; // nullable
      serializeFunctions: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure updateOne(filter: JObject; update: Variant); overload;
    procedure updateOne(filter: JObject; update: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure updateOne(filter: JObject; update: Variant; options: record
      upsert: Boolean; // nullable
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end); overload;
    procedure updateOne(filter: JObject; update: Variant; options: record
      upsert: Boolean; // nullable
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure updateMany(filter: JObject; update: Variant); overload;
    procedure updateMany(filter: JObject; update: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure updateMany(filter: JObject; update: Variant; options: record
      upsert: Boolean; // nullable
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end); overload;
    procedure updateMany(filter: JObject; update: Variant; options: record
      upsert: Boolean; // nullable
      w: Variant; // nullable
      wtimeout: Float; // nullable
      j: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure distinct(key: String; query: JObject); overload;
    procedure distinct(key: String; query: JObject; callback: procedure(err: JError; result: Variant)); overload;
    procedure distinct(key: String; query: JObject; options: record
      readPreference: String;
    end); overload;
    procedure distinct(key: String; query: JObject; options: record
      readPreference: String;
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure count; overload;
    procedure count(callback: procedure(err: JError; result: Variant)); overload;
    procedure count(query: JObject); overload;
    procedure count(query: JObject; callback: procedure(err: JError; result: Variant)); overload;
    procedure count(query: JObject; options: record
      readPreference: String;
    end); overload;
    procedure count(query: JObject; options: record
      readPreference: String;
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure drop; overload;
    procedure drop(callback: procedure(err: JError; result: Variant)); overload;
    procedure findAndModify(query: JObject; sort: array of Variant; doc: JObject); overload;
    procedure findAndModify(query: JObject; sort: array of Variant; doc: JObject; callback: procedure(err: JError; result: Variant)); overload;
    procedure findAndModify(query: JObject; sort: array of Variant; doc: JObject; options: record
      safe: Variant; // nullable
      remove: Boolean; // nullable
      upsert: Boolean; // nullable
      &new: Boolean; // nullable
    end); overload;
    procedure findAndModify(query: JObject; sort: array of Variant; doc: JObject; options: record
      safe: Variant; // nullable
      remove: Boolean; // nullable
      upsert: Boolean; // nullable
      &new: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure findAndRemove(query: JObject); overload;
    procedure findAndRemove(query: JObject; sort: array of Variant); overload;
    procedure findAndRemove(query: JObject; sort: array of Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure findAndRemove(query: JObject; sort: array of Variant; options: record
      safe: Variant;
    end); overload;
    procedure findAndRemove(query: JObject; sort: array of Variant; options: record
      safe: Variant;
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure findOneAndDelete(filter: Variant); overload;
    procedure findOneAndDelete(filter: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure findOneAndDelete(filter: Variant; options: record
      projection: Variant; // nullable
      sort: Variant; // nullable
      maxTimeMS: Float; // nullable
    end); overload;
    procedure findOneAndDelete(filter: Variant; options: record
      projection: Variant; // nullable
      sort: Variant; // nullable
      maxTimeMS: Float; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure findOneAndReplace(filter: Variant; replacement: Variant); overload;
    procedure findOneAndReplace(filter: Variant; replacement: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure findOneAndReplace(filter: Variant; replacement: Variant; options: record
      projection: Variant; // nullable
      sort: Variant; // nullable
      maxTimeMS: Float; // nullable
      upsert: Boolean; // nullable
      returnOriginal: Boolean; // nullable
    end); overload;
    procedure findOneAndReplace(filter: Variant; replacement: Variant; options: record
      projection: Variant; // nullable
      sort: Variant; // nullable
      maxTimeMS: Float; // nullable
      upsert: Boolean; // nullable
      returnOriginal: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    procedure findOneAndUpdate(filter: Variant; update: Variant); overload;
    procedure findOneAndUpdate(filter: Variant; update: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure findOneAndUpdate(filter: Variant; update: Variant; options: record
      projection: Variant; // nullable
      sort: Variant; // nullable
      maxTimeMS: Float; // nullable
      upsert: Boolean; // nullable
      returnOriginal: Boolean; // nullable
    end); overload;
    procedure findOneAndUpdate(filter: Variant; update: Variant; options: record
      projection: Variant; // nullable
      sort: Variant; // nullable
      maxTimeMS: Float; // nullable
      upsert: Boolean; // nullable
      returnOriginal: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    function find: JCursor; overload;
    function find(callback: procedure(err: JError; result: JCursor)): JCursor; overload;
    function find(selector: JObject): JCursor; overload;
    function find(selector: JObject; callback: procedure(err: JError; result: JCursor)): JCursor; overload;
    function find(selector: JObject; fields: Variant): JCursor; overload;
    function find(selector: JObject; fields: Variant; callback: procedure(err: JError; result: JCursor)): JCursor; overload;
    function find(selector: JObject; options: JCollectionFindOptions): JCursor; overload;
    function find(selector: JObject; options: JCollectionFindOptions; callback: procedure(err: JError; result: JCursor)): JCursor; overload;
    function find(selector: JObject; fields: Variant; options: JCollectionFindOptions): JCursor; overload;
    function find(selector: JObject; fields: Variant; options: JCollectionFindOptions; callback: procedure(err: JError; result: JCursor)): JCursor; overload;
    function find(selector: JObject; fields: Variant; skip: Float; limit: Float): JCursor; overload;
    function find(selector: JObject; fields: Variant; skip: Float; limit: Float; callback: procedure(err: JError; result: JCursor)): JCursor; overload;
    function find(selector: JObject; fields: Variant; skip: Float; limit: Float; timeout: Float): JCursor; overload;
    function find(selector: JObject; fields: Variant; skip: Float; limit: Float; timeout: Float; callback: procedure(err: JError; result: JCursor)): JCursor; overload;
    function findOne: JCursor; overload;
    function findOne(callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function findOne(selector: JObject): JCursor; overload;
    function findOne(selector: JObject; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function findOne(selector: JObject; fields: Variant): JCursor; overload;
    function findOne(selector: JObject; fields: Variant; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function findOne(selector: JObject; options: JCollectionFindOptions): JCursor; overload;
    function findOne(selector: JObject; options: JCollectionFindOptions; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function findOne(selector: JObject; fields: Variant; options: JCollectionFindOptions): JCursor; overload;
    function findOne(selector: JObject; fields: Variant; options: JCollectionFindOptions; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function findOne(selector: JObject; fields: Variant; skip: Float; limit: Float): JCursor; overload;
    function findOne(selector: JObject; fields: Variant; skip: Float; limit: Float; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    function findOne(selector: JObject; fields: Variant; skip: Float; limit: Float; timeout: Float): JCursor; overload;
    function findOne(selector: JObject; fields: Variant; skip: Float; limit: Float; timeout: Float; callback: procedure(err: JError; result: Variant)): JCursor; overload;
    procedure createIndex(fieldOrSpec: Variant); overload;
    procedure createIndex(fieldOrSpec: Variant; callback: procedure(err: JError; indexName: String)); overload;
    procedure createIndex(fieldOrSpec: Variant; options: JIndexOptions); overload;
    procedure createIndex(fieldOrSpec: Variant; options: JIndexOptions; callback: procedure(err: JError; indexName: String)); overload;
    procedure ensureIndex(fieldOrSpec: Variant); overload;
    procedure ensureIndex(fieldOrSpec: Variant; callback: procedure(err: JError; indexName: String)); overload;
    procedure ensureIndex(fieldOrSpec: Variant; options: JIndexOptions); overload;
    procedure ensureIndex(fieldOrSpec: Variant; options: JIndexOptions; callback: procedure(err: JError; indexName: String)); overload;
    procedure indexInformation(options: Variant); overload;
    procedure indexInformation(options: Variant; callback: JFunction); overload;
    procedure dropIndex(name: String); overload;
    procedure dropIndex(name: String; callback: JFunction); overload;
    procedure dropAllIndexes; overload;
    procedure dropAllIndexes(callback: JFunction); overload;
    procedure reIndex; overload;
    procedure reIndex(callback: JFunction); overload;
    procedure mapReduce(map: JFunction; reduce: JFunction; options: JMapReduceOptions); overload;
    procedure mapReduce(map: JFunction; reduce: JFunction; options: JMapReduceOptions; callback: JFunction); overload;
    procedure group(keys: JObject; condition: JObject; initial: JObject; reduce: JFunction; finalize: JFunction; command: Boolean; options: record
      readPreference: String;
    end); overload;
    procedure group(keys: JObject; condition: JObject; initial: JObject; reduce: JFunction; finalize: JFunction; command: Boolean; options: record
      readPreference: String;
    end; callback: JFunction); overload;
    procedure options; overload;
    procedure options(callback: JFunction); overload;
    procedure isCapped; overload;
    procedure isCapped(callback: JFunction); overload;
    procedure indexExists(indexes: String); overload;
    procedure indexExists(indexes: String; callback: JFunction); overload;
    procedure geoNear(x: Float; y: Float); overload;
    procedure geoNear(x: Float; y: Float; callback: JFunction); overload;
    procedure geoNear(x: Float; y: Float; options: JObject); overload;
    procedure geoNear(x: Float; y: Float; options: JObject; callback: JFunction); overload;
    procedure geoHaystackSearch(x: Float; y: Float); overload;
    procedure geoHaystackSearch(x: Float; y: Float; callback: JFunction); overload;
    procedure geoHaystackSearch(x: Float; y: Float; options: JObject); overload;
    procedure geoHaystackSearch(x: Float; y: Float; options: JObject; callback: JFunction); overload;
    procedure indexes; overload;
    procedure indexes(callback: JFunction); overload;
    procedure aggregate(pipeline: array of Variant); overload;
    procedure aggregate(pipeline: array of Variant; callback: procedure(err: JError; results: Variant)); overload;
    procedure aggregate(pipeline: array of Variant; options: record
      readPreference: String;
    end); overload;
    procedure aggregate(pipeline: array of Variant; options: record
      readPreference: String;
    end; callback: procedure(err: JError; results: Variant)); overload;
    procedure stats; overload;
    procedure stats(callback: procedure(err: JError; results: JCollStats)); overload;
    procedure stats(options: record
      readPreference: String;
      scale: Float;
    end); overload;
    procedure stats(options: record
      readPreference: String;
      scale: Float;
    end; callback: procedure(err: JError; results: JCollStats)); overload;
    hint: Variant;
  end;

  JDb = class external 'mongodb.Db'
    constructor Create(databaseName: String; serverConfig: JServer; dbOptions: JDbCreateOptions);
    function db(dbName: String): JDb;
    procedure open; overload;
    procedure open(callback: procedure(err: JError; db: JDb)); overload;
    procedure close; overload;
    procedure close(forceClose: Boolean); overload;
    procedure close(forceClose: Boolean; callback: procedure(err: JError; result: Variant)); overload;
    function admin: Variant; overload;
    function admin(callback: procedure(err: JError; result: Variant)): Variant; overload;
    procedure collectionsInfo(collectionName: String); overload;
    procedure collectionsInfo(collectionName: String; callback: procedure(err: JError; result: Variant)); overload;
    procedure collectionNames(collectionName: String; options: Variant); overload;
    procedure collectionNames(collectionName: String; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    function collection(collectionName: String): JCollection; overload;
    function collection(collectionName: String; callback: procedure(err: JError; collection: JCollection)): JCollection; overload;
    function collection(collectionName: String; options: JMongoCollectionOptions): JCollection; overload;
    function collection(collectionName: String; options: JMongoCollectionOptions; callback: procedure(err: JError; collection: JCollection)): JCollection; overload;
    procedure collections; overload;
    procedure collections(callback: procedure(err: JError; collections: array of JCollection)); overload;
    procedure eval(code: Variant; parameters: array of Variant); overload;
    procedure eval(code: Variant; parameters: array of Variant; options: Variant); overload;
    procedure eval(code: Variant; parameters: array of Variant; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure logout; overload;
    procedure logout(callback: procedure(err: JError; result: Variant)); overload;
    procedure logout(options: Variant); overload;
    procedure logout(options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure authenticate(userName: String; password: String); overload;
    procedure authenticate(userName: String; password: String; callback: procedure(err: JError; result: Variant)); overload;
    procedure authenticate(userName: String; password: String; options: Variant); overload;
    procedure authenticate(userName: String; password: String; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure addUser(username: String; password: String); overload;
    procedure addUser(username: String; password: String; callback: procedure(err: JError; result: Variant)); overload;
    procedure addUser(username: String; password: String; options: Variant); overload;
    procedure addUser(username: String; password: String; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure removeUser(username: String); overload;
    procedure removeUser(username: String; callback: procedure(err: JError; result: Variant)); overload;
    procedure removeUser(username: String; options: Variant); overload;
    procedure removeUser(username: String; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure createCollection(collectionName: String); overload;
    procedure createCollection(collectionName: String; callback: procedure(err: JError; result: JCollection)); overload;
    procedure createCollection(collectionName: String; options: JCollectionCreateOptions); overload;
    procedure createCollection(collectionName: String; options: JCollectionCreateOptions; callback: procedure(err: JError; result: Variant)); overload;
    procedure command(selector: JObject); overload;
    procedure command(selector: JObject; callback: procedure(err: JError; result: Variant)); overload;
    procedure command(selector: JObject; options: Variant); overload;
    procedure command(selector: JObject; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure dropCollection(collectionName: String); overload;
    procedure dropCollection(collectionName: String; callback: procedure(err: JError; result: Variant)); overload;
    procedure renameCollection(fromCollection: String; toCollection: String); overload;
    procedure renameCollection(fromCollection: String; toCollection: String; callback: procedure(err: JError; result: Variant)); overload;
    procedure lastError(options: JObject; connectionOptions: Variant); overload;
    procedure lastError(options: JObject; connectionOptions: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure previousError(options: JObject); overload;
    procedure previousError(options: JObject; callback: procedure(err: JError; result: Variant)); overload;
    procedure executeDbCommand(command_hash: Variant); overload;
    procedure executeDbCommand(command_hash: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure executeDbCommand(command_hash: Variant; options: Variant); overload;
    procedure executeDbCommand(command_hash: Variant; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure executeDbAdminCommand(command_hash: Variant); overload;
    procedure executeDbAdminCommand(command_hash: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure executeDbAdminCommand(command_hash: Variant; options: Variant); overload;
    procedure executeDbAdminCommand(command_hash: Variant; options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure resetErrorHistory; overload;
    procedure resetErrorHistory(callback: procedure(err: JError; result: Variant)); overload;
    procedure resetErrorHistory(options: Variant); overload;
    procedure resetErrorHistory(options: Variant; callback: procedure(err: JError; result: Variant)); overload;
    procedure createIndex(collectionName: Variant; fieldOrSpec: Variant; options: JIndexOptions); overload;
    procedure createIndex(collectionName: Variant; fieldOrSpec: Variant; options: JIndexOptions; callback: JFunction); overload;
    procedure ensureIndex(collectionName: Variant; fieldOrSpec: Variant; options: JIndexOptions); overload;
    procedure ensureIndex(collectionName: Variant; fieldOrSpec: Variant; options: JIndexOptions; callback: JFunction); overload;
    procedure cursorInfo(options: Variant); overload;
    procedure cursorInfo(options: Variant; callback: JFunction); overload;
    procedure dropIndex(collectionName: String; indexName: String); overload;
    procedure dropIndex(collectionName: String; indexName: String; callback: JFunction); overload;
    procedure reIndex(collectionName: String); overload;
    procedure reIndex(collectionName: String; callback: JFunction); overload;
    procedure indexInformation(collectionName: String; options: Variant); overload;
    procedure indexInformation(collectionName: String; options: Variant; callback: JFunction); overload;
    procedure dropDatabase; overload;
    procedure dropDatabase(callback: procedure(err: JError; result: Variant)); overload;
    procedure stats(options: Variant); overload;
    procedure stats(options: Variant; callback: JFunction); overload;
    procedure _registerHandler(db_command: Variant; raw: Variant; connection: Variant; exhaust: Variant); overload;
    procedure _registerHandler(db_command: Variant; raw: Variant; connection: Variant; exhaust: Variant; callback: JFunction); overload;
    procedure _reRegisterHandler(newId: Variant; &object: Variant); overload;
    procedure _reRegisterHandler(newId: Variant; &object: Variant; callback: JFunction); overload;
    function _callHandler(id: Variant; document: Variant; err: Variant): Variant;
    function _hasHandler(id: Variant): Variant;
    function _removeHandler(id: Variant): Variant;
    function _findHandler(id: Variant): record
      id: String;
      callback: JFunction; // nullable
    end;
    procedure __executeQueryCommand(self: Variant; db_command: Variant; options: Variant); overload;
    procedure __executeQueryCommand(self: Variant; db_command: Variant; options: Variant; callback: Variant); overload;
    DEFAULT_URL: String;
    procedure connect(url: String; options: record
      uri_decode_auth: Boolean; // nullable
    end); overload;
    procedure connect(url: String; options: record
      uri_decode_auth: Boolean; // nullable
    end; callback: procedure(err: JError; result: Variant)); overload;
    function addListener(event: String; handler: function(param: Variant): Variant): Variant;
  end;

  JMongoClient = class external 'mongodb.MongoClient'
    constructor Create(serverConfig: Variant; options: Variant);
    procedure connect(uri: String); overload;
    procedure connect(uri: String; callback: procedure(err: JError; db: JDb)); overload;
    procedure connect(uri: String; options: Variant); overload;
    procedure connect(uri: String; options: Variant; callback: procedure(err: JError; db: JDb)); overload;
  end;

  JObjectID = class external 'mongodb.ObjectID'
    constructor Create(s: String);
    function toHexString: String;
    function equals(otherID: JObjectID): Boolean;
    function getTimestamp: JDate;
    function createFromTime(time: Float): JObjectID;
    function createFromHexString(hexString: String): JObjectID;
    function isValid(id: String): Boolean;
    function generate: String; overload;
    function generate(time: Float): String; overload;
  end;

  JBinary = class external 'mongodb.Binary'
    constructor Create(buffer: JBuffer; subType: Float);
    procedure put(byte_value: Variant);
    procedure write(buffer: Variant; offset: Float);
    function read(position: Float; _length: Float): JBuffer;
    function value: String;
    function length: Float;
  end;
