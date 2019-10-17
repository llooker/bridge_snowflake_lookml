view: retail_category {
  sql_table_name: PUBLIC.RETAIL_CATEGORY ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: category_path {
    type: string
    sql: ${TABLE}."CATEGORY_PATH" ;;
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

  dimension: filterset_id {
    type: number
    sql: ${TABLE}."FILTERSET_ID" ;;
  }

  dimension: image {
    type: string
    sql: ${TABLE}."IMAGE" ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}."ORDERING" ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}."PARENT_ID" ;;
  }

  dimension: pos_automatic {
    type: yesno
    sql: ${TABLE}."POS_AUTOMATIC" ;;
  }

  dimension: product_type {
    type: number
    sql: ${TABLE}."PRODUCT_TYPE" ;;
  }

  dimension: shortcut {
    type: string
    sql: ${TABLE}."SHORTCUT" ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}."STORE_ID" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
