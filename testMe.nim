import os,httpclient,osproc

## of course one can not be bothered to get all this stuff
## 
## from github via fork , git clone etc.
##
## just todo a trial run to see if it works  
##
## hence here comes testMe.
## 
## get this file only and compile it like so :
## 
## nim c -r -d:ssl testMe 
##
##


proc source() = 
   var afile = "https://raw.githubusercontent.com/qqtop/NimFinLib/master/nimFinLib.nim"
   downloadFile(afile,"nimFinLib.nim")
   afile = "https://raw.githubusercontent.com/qqtop/NimFinLib/master/example1.nim"
   downloadFile(afile,"example1.nim")

source()
var exitCode = execCmd("nim -d:release -d:speed --hints:off --verbosity:0 -w:off c -r " & "example1.nim") 

# here comes the janitor in his sparetime and does some quick cleaning
removeFile("nimFinLib.nim")
removeFile("example1.nim")
removeFile("example1")
removeFile("testMe")

echo()
echo "Thank you for testing nimFinLib"
echo()
