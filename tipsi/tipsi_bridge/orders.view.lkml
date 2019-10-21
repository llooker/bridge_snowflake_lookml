view: orders_tipsi_bridge {
  derived_table: {
    explore_source: orders {
      column: id {}
      column: name {}
      column: created { field: created_date }
      derived_column: gift_recipient {
        sql: null ;;
      }
      column: variant {}
      derived_column: source {
        sql: 'tipsi' ;;
      }
      column: quantity {}
      column: store_id {}
    }
  }
  dimension: id {
    type: number
  }
  dimension: name {}
  dimension: created {}
  dimension: gift_recipient {
    type: string
  }
  dimension: variant {}
  dimension: source {
    type: string
  }
  dimension: quantity {}
  dimension: store_id {}
}
