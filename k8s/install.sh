#!/usr/bin/env bash

_red() {
    printf '\033[0;31;31m%b\033[0m' "$1"
}

_green() {
    printf '\033[0;31;32m%b\033[0m' "$1"
}

_yellow() {
    printf '\033[0;31;33m%b\033[0m' "$1"
}

_blue() {
    printf '\033[0;31;36m%b\033[0m' "$1"
}

next() {
    printf "%-70s\n" "-" | sed 's/\s/-/g'
}

get_opsy() {
    [ -f /etc/redhat-release ] && awk '{print $0}' /etc/redhat-release && return
    [ -f /etc/os-release ] && awk -F'[= "]' '/PRETTY_NAME/{print $3,$4,$5}' /etc/os-release && return
    [ -f /etc/lsb-release ] && awk -F'[="]+' '/DESCRIPTION/{print $2}' /etc/lsb-release && return
}

# Get System information
get_system_info() {
    opsy=$(get_opsy)
    arch=$(uname -m)
}

print_system_info() {
    echo " OS                 : $(_blue "$opsy")"
    echo " Arch               : $(_blue "$arch ($lbit Bit)")"
}

print_intro() {
    echo "-------------------- A K8S Installation Script By DevOpsify -------------------"
    echo " Version            : $(_green v2024-03-08)"
    echo " Usage              : $(_red "wget -qO- https://go.opsify.dev/setup-k8s | bash")"
}

start_time=$(date +%s)
get_system_info
clear
print_intro
next
print_system_info