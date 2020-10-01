#!/bin/bash

#export URL="https://mobi-it-prod.app.mobiliar.ch/crt/badges"
export URL="https://mobi-it-preprod.app.mobiliar-preprod.ch/crt/badges"
export HEADER="accept: application/json"

badge_value() {
    BADGE=$1
    NAME=$2
    VALUE=$3
    curl -m 5 -sX PUT "$URL/$BADGE?name=$NAME&value=$VALUE" -H "$HEADER" || :
}

badge_ncol() {
    BADGE=$1
    COLOR=$2
    curl -m 5 -sX PUT "$URL/$BADGE?ncolor=$COLOR" -H "$HEADER" || :
}

badge_vcol() {
    BADGE=$1
    COLOR=$2
    curl -m 5 -sX PUT "$URL/$BADGE?vcolor=$COLOR" -H "$HEADER" || :
}
