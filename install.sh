#!/bin/bash
PROFILE=${PROFILE:-personal}
exec "$(dirname "$0")/profiles/${PROFILE}.sh"
