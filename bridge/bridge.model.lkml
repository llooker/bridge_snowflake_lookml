connection: "warehouse2"

include: "*.view.lkml"
include: "../tipsi/tipsi.explore.view"
include: "../drync/drync.explore.view"

explore: users {
  join: orders_bridge {
    type: left_outer
    sql_on: ${users.p_key} = ${orders_bridge.source_user_id} ;;
    relationship: one_to_many
  }
  join: order_product_bridge {
    type: left_outer
    sql_on: ${orders_bridge.source_id} = ${order_product_bridge.source_order_id} ;;
    relationship: one_to_many
  }
  join: products_bridge {
    type: left_outer
    sql_on: ${order_product_bridge.source_bottle_id} = ${products_bridge.source_product_id} ;;
    relationship: one_to_many
  }
}

explore: products_bridge {
  label: "Products"
}

explore: orders_bridge {
  label: "Orders"
}
