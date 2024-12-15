#/opt/tomcat/apache-tomcat-9.0.60/bin/startup.sh ######START TOMCAT
#:: the code is the documentation
javac -version
#groovyc -version
#7z -version
# Without prop or other resources some operations might fail - .java files only.
rm -drf lib
mkdir lib
cd lib
cd ../src/main/webapp/WEB-INF/lib/
for d in * ; do
    echo "$d"
cd ../../../../../lib
mkdir "$d"
cd ../
cd src/main/webapp/WEB-INF/lib/"$d"
find $PWD -type f -name "*.java" > ../../../../../../lib/"$d"/sources.txt
cd ../../../../../../
javac @./lib/"$d"/sources.txt -d ./lib/"$d" > ./lib/"$d"/build.log
cd lib/"$d"
7z a -r ../"$d".jar *
cd ..
rm -drf  "$d"
cd ../src/main/webapp/WEB-INF/lib/
done

cd ../../../../../
rm -drf dist
mkdir -p dist/app
cd dist
cp -r ../src/main/webapp/* ./app/
rm -drf app/WEB-INF/lib/
cd ..
mkdir dist/app/WEB-INF/lib
cp lib/*.jar dist/app/WEB-INF/lib/
rm -drf lib
cd src/main/groovy
find $PWD -type f -name "*.java" > ../../../dist/sources.txt
cd ../../../dist/app/WEB-INF
mkdir classes
cd classes
groovyc -cp "../lib/servlet-api-2.5.jar" @../../../sources.txt
cd ../../../../dist/app
7z a -tzip -r ../ROOT.war *
cd ..
rm -drf app
rm -f sources.txt
curl http://rodrigo:baruna@localhost:8080/manager/text/undeploy?path=/
curl http://rodrigo:baruna@localhost:8080/manager/text/deploy?war=file:/home/rodrigo/Documents/dev/war-generator-main/dist/ROOT.war
firefox http://localhost:8080/TimeServlet
