view: products_drync_bridge {
  derived_table: {
    explore_source: products_drync {
      column: id {}
      column: product_id { field: products_drync.bridge_product_id }
      column: brand {}
      column: name {}
      column: variant {}
      derived_column: source {
        sql: 'drync' ;;
      }
      column: size {}
      column: category {}
      column: subcategory {}

    }
  }
  dimension: id {
    type: number
  }
  dimension: product_id {}
  dimension: brand {}
  dimension: name {}
  dimension: variant {}
  dimension: source {
    type: string
  }
  dimension: size {}
  dimension: category {}
  dimension: subcategory {}
}
