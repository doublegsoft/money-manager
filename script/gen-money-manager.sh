export MODELBASE_MODEL_ROOT=/Volumes/EXPORT/local/works/doublegsoft.biz/stdbiz/03.Development/stdbiz-spec
export MODELBASE_DATA_ROOT=/Volumes/EXPORT/local/works/doublegsoft.io/modelbase/03.Development/modelbase-data
export PROJBASE_DATA_ROOT=/Volumes/EXPORT/local/works/doublegsoft.io/projbase/03.Development/projbase-data
export MODELBASE_JAR=/Volumes/EXPORT/local/works/doublegsoft.org/protosys/03.Development/protosys-plugin-modelbase/target/protosys-plugin-modelbase-6.0-shaded.jar
export PROJBASE_JAR=/Volumes/EXPORT/local/works/doublegsoft.org/protosys/03.Development/protosys-plugin-projbase/target/protosys-plugin-projbase-4.5-shaded.jar
export OUTPUT_ROOT=out

export SPEC=money-manager

export APPNAME=money-manager
export NAMESPACE=
export MOBELBASE_MODEL=spec/$SPEC.modelbase
export PROJECT_ROOT=$OUTPUT_ROOT/$APPNAME-base
################################################################################
##                                                                            ##
##                                  OBJECTIVE-C                               ##
##                                                                            ##
################################################################################

REPOS=("objectivec-poco@gfc-1.x" "objectivec-dto@gfc-1.x" "objectivec-json@cocoa-1.x" \
"objectivec-db@sqlite-1.x" "objectivec-sql@gfc-1.x" "objectivec-util@gfc-1.x")

for repo in "${REPOS[@]}"
do
export TEMPLATE_ROOT=$MODELBASE_DATA_ROOT/objectivec/$repo

java -jar $MODELBASE_JAR \
--model=$MOBELBASE_MODEL \
--template-root=$TEMPLATE_ROOT \
--output-root=$PROJECT_ROOT \
--license=spec/LICENSE \
--globals=\
\{\
\"application\":\"$APPNAME\",\
\"namespace\":\"$NAMESPACE\",\
\"artifact\":\"$APPNAME\",\
\"version\":\"1.0.0\",\
\"description\":\"\",\
\"naming\":\"com.doublegsoft.jcommons.programming.objc.ObjcConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.objc.ObjcNamingConvention\",\
\"language\":\"objc\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\]\
\} 2>&1

done

export TEMPLATE_ROOT="$PROJBASE_DATA_ROOT/objectivec/objectivec-universal@gfc%xcode#library-1.x"

java -jar $PROJBASE_JAR \
--modelbase=$MOBELBASE_MODEL \
--template-root=$TEMPLATE_ROOT \
--output-root=$PROJECT_ROOT \
--license=spec/LICENSE \
--globals=\
\{\
\"application\":\"$APPNAME\",\
\"appalias\":\"$APPNAME-base\",\
\"namespace\":\"$NAMESPACE\",\
\"artifact\":\"$APPNAME\",\
\"version\":\"1.0.0\",\
\"description\":\"\",\
\"naming\":\"com.doublegsoft.jcommons.programming.objc.ObjcConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.objc.ObjcNamingConvention\",\
\"language\":\"objc\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\]\
\} 2>&1

#export DEV_ROOT=/Volumes/EXPORT/local/works/doublegsoft.me/money-manager/03.Development/money-manager/ios
#cp -rf $PROJECT_ROOT/Sources/DB/* $DEV_ROOT/Sources/DB
#cp -rf $PROJECT_ROOT/Sources/SQL/* $DEV_ROOT/Sources/SQL
#cp -rf $PROJECT_ROOT/Sources/DTO/* $DEV_ROOT/Sources/DTO
#cp -rf $PROJECT_ROOT/Sources/POCO/* $DEV_ROOT/Sources/POCO
#cp -rf $PROJECT_ROOT/Sources/JSON/* $DEV_ROOT/Sources/JSON
