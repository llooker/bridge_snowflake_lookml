view: orders_drync_bridge {
  derived_table: {
    explore_source: orders_drync {
      column: id {}
      column: created { field: orders_drync.created_date }
      derived_column: gift_recipient {
        sql: null ;;
      }
      derived_column: source {
        sql: 'drync' ;;
      }
      column: quantity {}
      column: store_id { field: orders_drync.shopping_fulfiller_id }
      column: user_id {}

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
}
