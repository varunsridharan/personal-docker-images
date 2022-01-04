#!/bin/sh

RAW_SOURCE="/mnt/source"
PROCESSED_SOURCE="/mnt/processed/"
RAW_DEST="/mnt/dest/"

handle_file(){
  FILE="$1"
  FILE_BASE_NAME="$(basename "$FILE")"
  FILE_NAME_ARR=($(echo "$FILE_BASE_NAME" | tr "." "\n"))
  FILE_EXT="${FILE_NAME_ARR[1]}"

  if [ "aac" == "$FILE_EXT" ]; then
    echo "Processing : ${FILE}"
    FILE_CONTACT_TIME=($(echo "${FILE_NAME_ARR[0]}" | tr "-" "\n"))
    FETCH_CONTACT_NAME_NUMBER="${FILE_CONTACT_TIME[0]}"
    FILTER_NAME=($(echo "${FETCH_CONTACT_NAME_NUMBER}" | tr "+" "\n"))
    CONTACT_NAME="${FILTER_NAME[0]}"
    CALL_DATETIME_RAW="${FILE_CONTACT_TIME[1]}"
    CALL_YEAR="${CALL_DATETIME_RAW:0:4}"
    CALL_MONTH="${CALL_DATETIME_RAW:4:2}"
    CALL_DAY="${CALL_DATETIME_RAW:6:2}"
    CALL_HOUR="${CALL_DATETIME_RAW:8:2}"
    CALL_MINUTE="${CALL_DATETIME_RAW:10:2}"
    CALL_SECOND="${CALL_DATETIME_RAW:12:2}"
    CALL_CUSTOM_DATE=$(echo $(date +"%Y/%b/%d-%a" -d "$CALL_YEAR/$CALL_MONTH/$CALL_DAY"))

    if [ ! -d "$PROCESSED_SOURCE/$CONTACT_NAME/$CALL_CUSTOM_DATE" ]; then
      mkdir -p "$PROCESSED_SOURCE/$CONTACT_NAME/$CALL_CUSTOM_DATE"
    fi

    cp $FILE "$PROCESSED_SOURCE/$CONTACT_NAME/$CALL_CUSTOM_DATE/$CALL_HOUR.$CALL_MINUTE.$CALL_SECOND.aac"
    mv $FILE "$RAW_DEST/$FILE_BASE_NAME"
  fi
}

echo ""
echo ""
echo "========================================================"
echo "START TIME : $(date)"
#echo '--------------------------------------------------------'
echo "RAW Source : ${RAW_SOURCE}"
echo "Processed : ${PROCESSED_SOURCE}"
echo "RAW Dest : ${RAW_DEST}"
#echo '_________________________________________________________'
echo " "
for entry in "${RAW_SOURCE}"/*; do
	if [ ! -d $entry ]; then
	  handle_file "$entry"
  elif [ -d $entry ]; then
    for sub_entry in "${RAW_SOURCE}/${entry}"/*; do
      handle_file "$sub_entry"
    done
	fi
done
echo " "
#echo '_________________________________________________________'
echo "END TIME : $(date)"
echo "========================================================"
echo " "
echo " "

