#!/bin/bash

[ -n "$NXAGENT_CONFIG" ] && echo -e "$NXAGENT_CONFIG" >/opt/nxagentd/nxagentd.conf

ARGS="-f"
[ -n "$NXAGENT_REGISTERSERVER" ] && ARGS="$ARGS -r $NXAGENT_REGISTERSERVER"
[ -n "$NXAGENT_CONFIGSERVER" ] && ARGS="$ARGS -M $NXAGENT_CONFIGSERVER"
[ -n "$NXAGENT_LOGLEVEL" ] && ARGS="$ARGS -D $NXAGENT_LOGLEVEL"
[ -n "$NXAGENT_PLATFORMSUFFIX" ] && ARGS="$ARGS -P $NXAGENT_PLATFORMSUFFIX"

exec /usr/bin/nxagentd -c /opt/nxagentd/nxagentd.conf $ARGS
