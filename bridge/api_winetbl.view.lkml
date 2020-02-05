view: api_winetbl_bridge {
  sql_table_name: "BRIDGE"."API_WINETBL"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
  }

  dimension: appellation_id {
    type: number
    sql: ${TABLE}."APPELLATION_ID" ;;
  }

  dimension: color_raw {
    type: number
    hidden: yes
    sql: ${TABLE}."COLOR" ;;
  }

  dimension: color {
    type: string
    case: {
      when: {
        label: "White"
        sql: ${color_raw} = 1 || 2 || 3 ;;
      }
      when: {
        label: "Rose"
        sql: ${color_raw} = 4 ;;
      }
      when: {
        label: "Red"
        sql: ${color_raw} = 5 || 6 || 7 ;;
      }
    }
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

  dimension: type_raw {
    type: number
    hidden: yes
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: type {
    type: string
    case: {
      when: {
        label: "Regular"
        sql: ${type_raw} = 0 ;;
      }
      when: {
        label: "Fortified"
        sql: ${type_raw} = 1 ;;
      }
      when: {
        label: "Sparkling"
        sql: ${type_raw} = 2 ;;
      }
      when: {
        label: "Dessert"
        sql: ${type_raw} = 3 ;;
      }
      when: {
        label: "Off-Dry"
        sql: ${type_raw} = 4 ;;
      }
    }
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

  dimension: vineyard_id {
    type: number
    sql: ${TABLE}."VINEYARD_ID" ;;
  }

  dimension: vintage {
    type: number
    sql: ${TABLE}."VINTAGE" ;;
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
    drill_fields: [id, custom_name, name, color, type]
  }
}
