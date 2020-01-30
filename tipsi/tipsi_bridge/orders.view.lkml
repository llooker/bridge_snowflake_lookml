view: orders_tipsi_bridge {
  derived_table: {
    explore_source: orders_tipsi {
      column: id {}
      column: created_time { field: orders_tipsi.created_time }
      derived_column: gift_recipient {
        sql: null ;;
      }
      derived_column: source {
        sql: 'tipsi' ;;
      }
      column: quantity { field: orders_tipsi.total_count }
      column: store_id {}
      column: user_id {}
      column: discount { field: orders_tipsi.products_discount }
      column: total_price {}
      column: status {field: orders_tipsi.order_status}
      column: actual_order_price {}
    }
  }
  dimension: id {
    type: number
  }
  dimension_group: created {
    type: time
    sql: ${TABLE}.created_time ;;
  }
  dimension: gift_recipient {
    type: string
  }
  dimension: source {
    type: string
  }
  dimension: quantity {
    type: number
  }
  dimension: store_id {}
  dimension: user_id {}
  dimension: discount {}
  dimension: total_price {}
  dimension: status {}
}
