include: "../drync/drync_bridge/order_product.view.lkml"
include: "../tipsi/tipsi_bridge/order_product.view.lkml"




view: order_product_bridge {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:   SELECT * FROM ${order_product_drync_bridge.SQL_TABLE_NAME}
            UNION
            SELECT * FROM ${order_product_tipsi_bridge.SQL_TABLE_NAME}
      ;;
  }

  dimension: id {
    type: number
  }

  dimension: pk_id {
    type: string
    primary_key: yes
    sql: ${source} || ${id} ;;
  }
  dimension: order_id {}

  dimension: source_order_id {
    type: string
    sql: ${source} || ${order_id} ;;
  }

  dimension: bottle_id {}

  dimension: source_bottle_id {
    type: string
    sql: ${source} || ${bottle_id} ;;
  }
  dimension: source {
    type: string
  }

  measure: count {
    type: count
  }
}
