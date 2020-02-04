connection: "warehouse2"

include: "*.view.lkml"
include: "../tipsi/tipsi.explore.view"
include: "../drync/drync.explore.view"
include: "../throtle/*.view"
include: "../affinity/affinity_analysis.view"
include: "../affinity/item_affinity_analysis.dashboard"

explore: users {
  group_label: "⭐ United"
  description: "Start here to analyze purchasing history from Drync, Tipsi, and Bridge"
  join: attributes {
    type: inner
    sql_on: ${users.source_id} = ${attributes.id} ;;
    relationship: one_to_many
  }
  join: attributes_extended {
    type: inner
    sql_on: ${users.source_id} = ${attributes_extended.id} ;;
    relationship: one_to_many
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
  group_label: "⭐ United"
  label: "Products"
}

# explore: orders_bridge {
#   group_label: "⭐ United"
#   label: "Orders"
#   sql_always_where: (${orders_bridge.status} NOT IN  ('cancelled','declined') OR ${orders_bridge.id} IS NULL)  ;;
#
# }

explore: order_product_bridge {
  group_label: "⭐ United"
  label: " 💰Order Items"
  sql_always_where: (${orders_bridge.status} NOT IN  ('cancelled','declined') OR ${orders_bridge.id} IS NULL)  ;;
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
    sql_on: ${order_product_bridge.order_id} = ${orders_bridge.id}
        and ${order_product_bridge.source} = ${orders_bridge.source};;

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
    relationship: many_to_one
  }
  join: fulfillers_bridge {
    type: inner
    sql_on: ${orders_bridge.store_id} = ${fulfillers_bridge.fulfiller_id}
    and ${order_product_bridge.source} = ${fulfillers_bridge.source};;
    relationship: many_to_one
  }
}

explore: attributes {
  group_label: "⭐ United"
}

explore: attributes_extended {group_label: "⭐ United"}

explore: devices_bridge {group_label: "⭐ United"}
