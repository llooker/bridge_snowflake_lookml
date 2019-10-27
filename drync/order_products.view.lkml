view: order_products {
  sql_table_name: production.production.line_items ;;

  dimension: id {
    primary_key: yes
    hidden:  yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bottle_id {
    type: number
    sql: ${TABLE}.bottle_id ;;
  }

  dimension: shipment_id {
    type: number
    sql: ${TABLE}.shipment_id ;;
  }

  dimension: price_per_bottle {
    type: number
    sql: ${TABLE}.price_per_bottle ;;
  }
}
