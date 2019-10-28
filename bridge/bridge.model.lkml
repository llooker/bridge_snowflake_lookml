connection: "warehouse2"

include: "*.view.lkml"
include: "../tipsi/tipsi.explore.view"
include: "../drync/drync.explore.view"

explore: users {
  join: orders_bridge {
    type: left_outer
    sql_on: ${users.p_key} = ${orders_bridge.source_user_id} ;;
    relationship: many_to_many
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

explore: order_product_bridge {
  label: "Order Products"
  join: products_bridge {
    type: left_outer
    sql_on: ${order_product_bridge.source_bottle_id} = ${products_bridge.source_product_id} ;;
    relationship: many_to_one
  }
  join: orders_bridge {
    type: left_outer
    sql_on: ${order_product_bridge.source_order_id} = ${orders_bridge.source_id} ;;
    relationship: many_to_one
  }
  join: users {
    view_label: "Users with Orders"
    type: left_outer
    sql_on: ${orders_bridge.source_user_id} = ${users.p_key}  ;;
    relationship: many_to_one

  }
}
