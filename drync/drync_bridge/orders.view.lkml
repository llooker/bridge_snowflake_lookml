view: orders_drync_bridge {
  derived_table: {
    explore_source: orders_drync {
      column: id {}
      column: created_time { field: orders_drync.created_time }
      derived_column: gift_recipient {
        sql: null ;;
      }
      derived_column: source {
        sql: 'drync' ;;
      }
      column: quantity {}
      column: store_id { field: orders_drync.shopping_fulfiller_id }
      column: user_id {}
      column: discount {}
      column: total_price {}
      column: status {field: orders_drync.status}
      column: actual_order_price {}
      column: payment_method {field:payments.credit_card_source}
#       column: sub_total {}
#       column: deposit {}
#       column: tax {}
#       column: shippping {}
#       column: shipping_adjustment {}
#       column: deliver_tip {}

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
  #dimension: quantity {
#     type: number
#   }
  dimension: store_id {}
  dimension: user_id {}
  dimension: status {}
#   dimension: discount {}
#   dimension: total_price {}
}
