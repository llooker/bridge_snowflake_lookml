view: vendor_drink_bridge {
  sql_table_name: "BRIDGE"."VENDOR_DRINK"
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

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: drink_type_raw {
    type: number
    hidden: yes
    sql: ${TABLE}."DRINK_TYPE" ;;
  }

  dimension: drink_type {
    type: string
    case: {
      when: {
        label: "Other"
        sql: ${drink_type_raw} = 0 ;;
      }
      when: {
        label: "Beer"
        sql: ${drink_type_raw} = 1 ;;
      }
      when: {
        label: "Spirit"
        sql: ${drink_type_raw} = 2 ;;
      }
      when: {
        label: "Cocktail"
        sql: ${drink_type_raw} = 3 ;;
      }
      else: "Other"
    }
  }

  dimension: label_url {
    type: string
    sql: ${TABLE}."LABEL_URL" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: producer_id {
    type: number
    sql: ${TABLE}."PRODUCER_ID" ;;
  }

  dimension: tag_id {
    type: number
    sql: ${TABLE}."TAG_ID" ;;
  }

  dimension: thumb_list_url {
    type: string
    sql: ${TABLE}."THUMB_LIST_URL" ;;
  }

  dimension: thumb_product_url {
    type: string
    sql: ${TABLE}."THUMB_PRODUCT_URL" ;;
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

  measure: count {
    type: count
    drill_fields: [id, name, description, drink_type]
  }
}
