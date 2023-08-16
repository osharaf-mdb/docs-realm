
#! /bin/bash

# Use colors in terminal messages: https://notesontech.com/bash-text-formatting/
### Text formatting ###

CLEAR="\x1B[0m"

# Text settings.
BOLD="\x1B[1m"

# Text color.
RED="\x1B[31m"
GREEN="\x1B[32m"
YELLOW="\x1B[33m"

# Background color with bold font.
GREEN_BG_BOLD="\x1B[1;42m"

### End of text formatting ###

PROJECT=$(git rev-parse --show-toplevel)
INPUT_DIRECTORY=$PROJECT/examples/react-native/v12/TestApp
OUTPUT_DIRECTORY=$PROJECT/source/examples/generated/react-native/v12

# standard bluehawking
rm -f $OUTPUT_DIRECTORY/*
echo "${GREEN_BG_BOLD}Bluehawk: ${CLEAR} ${GREEN} Generate React Native v12 examples ${CLEAR}"
bluehawk snip $INPUT_DIRECTORY -o $OUTPUT_DIRECTORY --format=rst

FILES_TO_REMOVE=$(find $OUTPUT_DIRECTORY -type f -not -name "*.rst")

echo "
${YELLOW}Removing:${CLEAR}
$FILES_TO_REMOVE"
echo "
${YELLOW}From:${CLEAR} $OUTPUT_DIRECTORY"

# Delete non-.rst files in output directory.
find $OUTPUT_DIRECTORY -type f -not -name "*.rst" -delete
echo "
Non-.rst files removed."

echo "
${GREEN_BG_BOLD} Bluehawk: ${CLEAR} Complete!"

# TODO: for using Detype to generate JS from TS.
# npx detype "$OUTPUT_DIRECTORY" "$OUTPUT_DIRECTORY"