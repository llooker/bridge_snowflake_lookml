include: "../drync/drync_bridge/orders.view.lkml"
include: "../tipsi/tipsi_bridge/orders.view.lkml"




view: orders_bridge {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:  SELECT * FROM ${orders_drync_bridge.SQL_TABLE_NAME}
            UNION
          SELECT * FROM ${orders_tipsi_bridge.SQL_TABLE_NAME}
      ;;
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
}
