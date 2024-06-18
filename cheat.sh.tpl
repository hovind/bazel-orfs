set -eux -o pipefail
export YOSYS_CMD=${BASE}/{YOSYS_PATH}
export OPENROAD_CMD={BASE}/{OPENROAD_PATH}
export FLOW_HOME=${BASE}/{MAKEFILE_DIR}
make --file ${BASE}/{MAKEFILE_PATH} "$@"
