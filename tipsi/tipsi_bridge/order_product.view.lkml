view: order_product_tipsi_bridge {
  derived_table: {
    explore_source: order_products_tipsi {
      column: id {}
      column: order_id {}
      column: bottle_id {}
      derived_column: source {
        sql: 'tipsi' ;;
      }
    }
  }
  dimension: id {
    type: number
  }
  dimension: order_id {}
  dimension: bottle_id {}
  dimension: source {
    type: string
  }
}
