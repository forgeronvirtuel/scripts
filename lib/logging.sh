# Simple library for logging to syslog.
# By default it uses `user` facility, but you can override it by setting
# `LOG_FACILITY` variable. A second variable `LOG_TAG` is used to
# identify the origin in syslog, for instance:
# 
# `$ tail -f /var/log/syslog | grep $LOG_TAG.`
#
# Usage:
#   LOG_FACILITY=local0
#   LOG_TAG=install_go
# 
#   source $SCRIPTS_PATH/logging.sh
# 
#   info "This is info"
#   debug "This is debug"
#   crit "This is critical"
#   emerg "This is emergency"
#   warning "This is warning"
#   notice "This is notice"
#   err "This is err"
#   alert "This is alert"
#

emerg() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.emerg -t $LOG_TAG $@
}

alert() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.alert -t $LOG_TAG $@
}

crit() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.crit -t $LOG_TAG $@
}

err() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.err -t $LOG_TAG $@
}

warning() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.warning -t $LOG_TAG $@
}

notice() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.notice -t $LOG_TAG $@
}

info() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.info -t $LOG_TAG $@
}

debug() {
    LOG_FACILITY=${LOG_FACILITY:-user}
    logger -si -p $LOG_FACILITY.debug -t $LOG_TAG $@
}