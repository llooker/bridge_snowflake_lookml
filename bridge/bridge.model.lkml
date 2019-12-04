connection: "warehouse2"

include: "*.view.lkml"
include: "../tipsi/tipsi.explore.view"
include: "../drync/drync.explore.view"
include: "../throtle/*.view"
include: "../affinity/affinity_analysis.view"
include: "../affinity/item_affinity_analysis.dashboard"

explore: users {
  join: attributes {
    type: inner
    sql_on: ${users.source_id} = ${attributes.id} ;;
    relationship: one_to_one
  }
  join: attributes_extended {
    type: inner
    sql_on: ${users.source_id} = ${attributes_extended.id} ;;
    relationship: one_to_one
  }
  join: orders_bridge {
    type: left_outer
    sql_on: ${users.source_id} = ${orders_bridge.source_user_id} ;;
    relationship: many_to_many
  }
  join: order_product_bridge {
    type: left_outer
    sql_on: ${orders_bridge.source_id} = ${order_product_bridge.source_order_id} ;; #need to use a product id in left table to join
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
    sql_on: ${order_product_bridge.bottle_id} =
    case when order_product_bridge.source = 'drync' then ${products_bridge.id}
    when order_product_bridge.source = 'tipsi' then ${products_bridge.product_id}
    else false end

    AND ${products_bridge.source} =
    case when ${orders_bridge.source}='drync' then 'drync'
    when ${orders_bridge.source}='tipsi' then 'tipsi'
    else false end
    ;;
    relationship: many_to_many #in order to change back to many_to_one, need to detect why this is fanning out from 1 to 48: https://dryncapp.looker.com/explore/bridge/order_product_bridge?qid=q6xkKWVQOtVrY59hu9gzU7
  }
  join: orders_bridge {
    type: left_outer
    sql_on: ${order_product_bridge.source_order_id} = ${orders_bridge.source_id} ;;
    relationship: many_to_one
  }
  join: users {
    view_label: "Users with Orders"
    type: left_outer
    sql_on: ${orders_bridge.source_user_id} = ${users.source_id}  ;;
    relationship: many_to_one
  }
  join: attributes {
    type: inner
    sql_on: ${users.source_id} = ${attributes.id} ;;
    relationship: one_to_one
  }
  join: attributes_extended {
    type: inner
    sql_on: ${users.source_id} = ${attributes_extended.id} ;;
    relationship: one_to_one
  }
}

explore: attributes {

}

explore: devices_bridge {}
