#!/usr/bin/env bash
source bach.sh

test-rm-rf() {
    project_log_path=/tmp/project/logs
    sudo rm -rf "$project_log_path/" # Typo!
    # An undefined bash variable is an empty string, which can be a serious problem!
}
test-rm-rf-assert() {
    sudo rm -rf /
}
