
  view: orders_bridge_united {
    derived_table: {
      explore_source: order_order_bridge {
        column: id {}
        column: created_time { field: order_order_bridge.created_time }
        column: quantity { field: order_order_bridge.total_count }
        column: store_id {}
        column: user_id {}
        column: discount { field: order_order_bridge.products_discount }
        column: total_price {}
        column: status {field: order_order_bridge.order_status}
        column: actual_order_price {}
        derived_column: payment_method {
          sql: null ;;
        }
        derived_column: subtotal {sql: null ;;}
        derived_column: deposit {sql: null ;;}
        derived_column: tax {sql: null ;;}
        derived_column: gift_recipient {
          sql: null ;;
        }
        derived_column: source {
          sql: 'bridge' ;;
        }
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
