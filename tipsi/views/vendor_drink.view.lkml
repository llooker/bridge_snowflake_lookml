view: vendor_drink {
  sql_table_name: PUBLIC.VENDOR_DRINK ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
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

  dimension: drink_type {
    type: number
    sql: ${TABLE}."DRINK_TYPE" ;;
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
    drill_fields: [id, name]
  }
}
