explore: order_items_base_drync {}
view: order_items_base_drync {
  derived_table: {
    explore_source: line_items {
      column: transaction_id { field: shipments.order_id }
      column: order_created_time { field: orders.created_time }
      column: SKU_id { field: products_drync.id }
      column: SKU_name { field: products_drync.name }
      column: brand_id { field: products_drync.brand_id }
      column: brand_name { field: products_drync.brand }
      column: department_id { field: products_drync.department_id }
      column: department_name { field: products_drync.department_name }
      column: user_id { field: orders.user_id }
      column: sale_amt { field: orders.sale_price }
      column: margin_amt { field: orders.margin_amt }
    }
  }
  dimension: transaction_id {
    type: number
  }
  dimension: order_created_time {
    type: date_time
  }
  dimension: id {
    type: number
  }
  dimension: name {}
  dimension: brand {}
  dimension: sale_price {
    value_format: "$#,##0.00"
    type: number
  }
}
