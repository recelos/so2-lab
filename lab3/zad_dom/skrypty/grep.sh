#!/bin/bash
ACCESS_LOG="../access_log"

# 10 unikalnych adresow IP
echo "10 unikalnych adresow IP:"
grep -oP "^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}" ${ACCESS_LOG} | sort | uniq | head -10

# 'denied w linku'
echo "zapytania z 'denied' w linku:"
grep -E "\Sdenied" ${ACCESS_LOG}

# zapytania z adresu 64.242.88.10
echo "zapytania z adresu 64.242.88.10:"
grep -E "^64\.242\.88\.10\b" ${ACCESS_LOG}

# zapytania FQDN
echo "zapytania FQDN:"
grep -E "^[a-z]" ${ACCESS_LOG}