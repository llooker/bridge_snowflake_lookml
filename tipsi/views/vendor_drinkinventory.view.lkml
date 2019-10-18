view: vendor_drinkinventory {
  sql_table_name: TIPSI.PUBLIC.VENDOR_DRINKINVENTORY ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: drink_id {
    type: number
    sql: ${TABLE}."DRINK_ID" ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}."ORDERING" ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}."PRICE" ;;
  }

  dimension: restaurant_id {
    type: number
    sql: ${TABLE}."RESTAURANT_ID" ;;
  }

  dimension: special_price {
    type: number
    sql: ${TABLE}."SPECIAL_PRICE" ;;
  }

  dimension: special_price_on {
    type: yesno
    sql: ${TABLE}."SPECIAL_PRICE_ON" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: visible {
    type: yesno
    sql: ${TABLE}."VISIBLE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}