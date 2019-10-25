view: order_products_drync {
  derived_table: {
    sql: select op.id as id, s.order_id as order_id, op.bottle_id as bottle_id
          from production.production.line_items op
          inner join production.production.shipments s on s.id = op.shipment_id ;;
    }

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: order_id {
      type: number
      sql: ${TABLE}.order_id ;;
    }

    dimension: bottle_id {
      type: number
      sql: ${TABLE}.bottle_id ;;
    }
}
