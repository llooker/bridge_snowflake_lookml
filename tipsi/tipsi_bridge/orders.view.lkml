view: orders_tipsi_bridge {
  derived_table: {
    explore_source: orders_tipsi {
      column: id {}
      column: created { field: orders_tipsi.created_date }
      derived_column: gift_recipient {
        sql: null ;;
      }
      derived_column: source {
        sql: 'tipsi' ;;
      }
      column: quantity { field: orders_tipsi.total_count }
      column: store_id {}
      column: user_id {}
      column: discount { field: orders_tipsi.products_discount }
      column: total_price {}

    }
  }
  dimension: id {
    type: number
  }
  dimension: created {}
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
}
