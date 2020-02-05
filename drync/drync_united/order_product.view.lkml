view: order_product_drync_united {
  derived_table: {
    explore_source: line_items {
      column: id {}
      column: order_id { field: shipments.order_id }
      column: bottle_id { field: line_items.bridge_bottle_id }
      column: price_per_bottle {}
      column: quantity {}
      column: discount_per_bottle {}
      column: fulfillment_method {field: shipments.fulfillment_method}
      derived_column: source {
        sql: 'drync' ;;
      }
      derived_column: order_list_price {
        sql: sum(price_per_bottle*quantity) over (partition by order_id) ;;
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
  dimension: order_list_price {
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
