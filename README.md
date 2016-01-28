# APIs
This repository will contain the Object Pascal headers of several APIs for various JavaScript libraries. The headers are mostly translated automatically from [TypeScript](https://github.com/DefinitelyTyped) definitions and might not be tested in every detail.

For copyright reasons the headers do not include the original JS files. For [Node.js](https://nodejs.org) this is not necessary at all as these will be installed through the package manager [NPM](https://www.npmjs.com/). For browsers you might need to create special libraries using [Browserify](http://browserify.org/).

For the browser there are several ways to add the external libraries. You can either add them as dedicated JS files (editing is possible, code will get part of your project) or as opaque resource files. Last but not least you can include the file with a {$R library} compiler directive. The latter won't include it in your project, but use the code found in the library subfolder.   

## Possible issues
So far, all units here compile, but they have by no means tested to run or work correctly. This means that you might sooner or later run into problems. In this case you either have to look at the TypeScript definitions to see if there is a translation error (which should be reported in the [ts2pas](https://github.com/cwbudde/ts2pas) issue tracker).

It could also be due to changes in the library. Then you either need to fix the header or re-translate the changes from the TypeScript definition. 

In both cases you should report this in the issue tracker
