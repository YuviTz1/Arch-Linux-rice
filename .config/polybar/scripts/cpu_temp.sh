#!/bin/bash
# Gets CPU temp using sensors, cuts out extra text
sensors | awk '/^Package id 0:/ { print int($4) "°C" }'
