#apt-get install subversion
cd DB
rm -drf db-derby-10.14.2.0-src
rm -drf db-derby-10.14.2.0-doc-src
7z x db-derby-10.14.2.0-src.zip
cd db-derby-10.14.2.0-src
ant -quiet clobber
ant -quiet buildsource
ant -quiet buildjars
cd ./jars/sane
rm -drf ../../../../ext/derby.jar
cp derby.jar ../../../../ext
rm -drf ../../../../ext/derbyrun.jar
cp derbyrun.jar ../../../../ext
rm -drf ../../../../ext/derbytools.jar
cp derbytools.jar ../../../../ext
rm -drf ../../../../ext/derbyclient.jar
cp derbyclient.jar ../../../../ext




