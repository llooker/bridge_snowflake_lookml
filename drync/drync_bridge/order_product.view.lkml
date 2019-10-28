view: order_product_drync_bridge {
  derived_table: {
    explore_source: line_items {
      column: id {}
      column: order_id { field: shipments.order_id }
      column: bottle_id {}
      column: price_per_bottle {}
      column: quantity {}
      column: discount_per_bottle {}
      derived_column: source {
        sql: 'drync' ;;
      }
    }
  }
  dimension: id {
    type: number
    primary_key: yes
  }
  dimension: order_id {
    type: number
  }
  dimension: bottle_id {
    type: number
  }
  dimension: price_per_bottle {
    value_format: "$#,##0.00"
    type: number
  }
  dimension: quantity {
    type: number
  }
  dimension: discount_per_bottle {
    value_format: "$#,##0.00"
    type: number
  }
  dimension: source {
    type: string
  }
}
