0=${(%):-%x}
autoload-dir ${0:A:h}/functions
fpath+=(${0:A:h}/functions)

ORGB_PROFILES_DIR=${0:A:h}/profiles

function rgb() {
  openrgb --config ${ORGB_PROFILES_DIR} -p ${1}
}