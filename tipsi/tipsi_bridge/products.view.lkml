view: products_tipsi_bridge {
  derived_table: {
    explore_source: products_tipsi {
      column: id {}
      column: product_id {}
      column: brand {}
      column: name {}
      column: variant {}
      derived_column: source {
        sql: 'tipsi' ;;
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
