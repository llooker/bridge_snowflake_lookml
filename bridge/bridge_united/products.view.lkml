view: products_bridge_united {
  derived_table: {
    explore_source: products_bridge {
      column: id {}
      column: product_id {}
      column: brand {}
      column: name {}
      column: variant {}
      derived_column: source {
        sql: 'bridge' ;;
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
