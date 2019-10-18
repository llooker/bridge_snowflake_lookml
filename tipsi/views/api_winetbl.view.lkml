view: api_winetbl {
  sql_table_name: TIPSI.PUBLIC.API_WINETBL ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Wine and Drink Combined {

  dimension:  name_combined {
    type: string
    sql: COALESCE(${api_winetbl.name},${vendor_drink.name}) ;;
  }
  #}

  dimension: appellation_id {
    type: number
    sql: ${TABLE}."APPELLATION_ID" ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}."COLOR" ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}."COUNTRY_ID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED" ;;
  }

  dimension: custom_name {
    type: string
    sql: ${TABLE}."CUSTOM_NAME" ;;
  }

  dimension: designation_id {
    type: number
    sql: ${TABLE}."DESIGNATION_ID" ;;
  }

  dimension: display_label_url {
    type: string
    sql: ${TABLE}."DISPLAY_LABEL_URL" ;;
  }

  dimension: extra_appellation_id {
    type: number
    sql: ${TABLE}."EXTRA_APPELLATION_ID" ;;
  }

  dimension: is_junk {
    type: yesno
    sql: ${TABLE}."IS_JUNK" ;;
  }

  dimension: is_provider_wine {
    type: yesno
    sql: ${TABLE}."IS_PROVIDER_WINE" ;;
  }

  dimension: is_standard_size {
    type: yesno
    sql: ${TABLE}."IS_STANDARD_SIZE" ;;
  }

  dimension: label_url {
    type: string
    sql: ${TABLE}."LABEL_URL" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: price_retail {
    type: number
    sql: ${TABLE}."PRICE_RETAIL" ;;
  }

  dimension: provider_info_id {
    type: number
    sql: ${TABLE}."PROVIDER_INFO_ID" ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}."REGION_ID" ;;
  }

  dimension: sub_appellation_id {
    type: number
    sql: ${TABLE}."SUB_APPELLATION_ID" ;;
  }

  dimension: sub_region_id {
    type: number
    sql: ${TABLE}."SUB_REGION_ID" ;;
  }

  dimension: thumb_list_url {
    type: string
    sql: ${TABLE}."THUMB_LIST_URL" ;;
  }

  dimension: thumb_product_url {
    type: string
    sql: ${TABLE}."THUMB_PRODUCT_URL" ;;
  }

  dimension_group: tineye_upload {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TINEYE_UPLOAD_DATE" ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}."TYPE" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UPDATED" ;;
  }

  dimension: validated {
    type: yesno
    sql: ${TABLE}."VALIDATED" ;;
  }

  dimension: varietal2_id {
    type: number
    sql: ${TABLE}."VARIETAL2_ID" ;;
  }

  dimension: varietal3_id {
    type: number
    sql: ${TABLE}."VARIETAL3_ID" ;;
  }

  dimension: varietal4_id {
    type: number
    sql: ${TABLE}."VARIETAL4_ID" ;;
  }

  dimension: varietal_id {
    type: number
    sql: ${TABLE}."VARIETAL_ID" ;;
  }

  dimension: vinatage {
    type: number
    sql: ${TABLE}."VINATAGE" ;;
  }

  dimension: vineyard_id {
    type: number
    sql: ${TABLE}."VINEYARD_ID" ;;
  }

  dimension: wine_url {
    type: string
    sql: ${TABLE}."WINE_URL" ;;
  }

  dimension: winemakers_note {
    type: string
    sql: ${TABLE}."WINEMAKERS_NOTE" ;;
  }

  dimension: winemakers_note_source_url {
    type: string
    sql: ${TABLE}."WINEMAKERS_NOTE_SOURCE_URL" ;;
  }

  dimension: winery_id {
    type: number
    sql: ${TABLE}."WINERY_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, custom_name]
  }
}