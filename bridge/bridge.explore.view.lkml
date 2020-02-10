include: "*.view.lkml"
include: "./derived_views/*.view.lkml"

explore: retail_retailinventory_bridge {
  group_label: "Bridge"
  join: api_winetbl {
    from: api_winetbl_bridge
    type: left_outer
    sql_on: ${retail_retailinventory_bridge.wine_id} = ${api_winetbl.id} ;;
    relationship: many_to_one
  }
  join: vendor_drink {
    from: vendor_drink_bridge
    type: left_outer
    sql_on: ${retail_retailinventory_bridge.drink_id} = ${vendor_drink.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkproducer {
    from: vendor_drinkproducer_bridge
    type: left_outer
    sql_on: ${vendor_drink.producer_id} = ${vendor_drinkproducer.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinktag {
    from: vendor_drinktag_bridge
    type: left_outer
    sql_on: ${vendor_drink.tag_id} = ${vendor_drinktag.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkinventory {
    from: vendor_drinkinventory_bridge
    type: left_outer
    sql_on: ${vendor_drink.id} = ${vendor_drinkinventory.drink_id} ;;
    relationship: one_to_many
  }
}

explore: users_bridge {
  from: tipsi_auth_user_bridge
  group_label: "Bridge"
  join: devices {
    from: notifications_fcmdevice_bridge
    view_label: "Devices"
    type: inner
    sql_on: ${users_bridge.id} = ${devices.user_id} ;;
    relationship: many_to_one
  }
  join: order_order {
    from: order_order_bridge
    view_label: "Orders"
    type: left_outer
    sql_on: ${users_bridge.id} = ${order_order.user_id} ;;
    relationship: one_to_many
  }
  join: order_orderproduct {
    from: order_orderproduct_bridge
    view_label: "Order Product"
    type: left_outer
    sql_on: ${order_order.id} = ${order_orderproduct.order_id} ;;
    relationship: many_to_one
  }
  join: vendor_drink {
    from: vendor_drink_bridge
    view_label: "Drinks"
    type: left_outer
    sql_on: ${order_orderproduct.drink_id} = ${vendor_drink.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkproducer {
    from: vendor_drinkproducer_bridge
    view_label: "Drink Producer"
    type: left_outer
    sql_on: ${vendor_drink.producer_id} = ${vendor_drinkproducer.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinktag {
    from: vendor_drinktag_bridge
    view_label: "Drink Tag"
    type: left_outer
    sql_on: ${vendor_drink.tag_id} = ${vendor_drinktag.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkinventory {
    from: vendor_drinkinventory_bridge
    view_label: "Drink Inventory"
    type: left_outer
    sql_on: ${vendor_drink.id} = ${vendor_drinkinventory.drink_id} ;;
    relationship: one_to_many
  }
  join: api_winetbl {
    from: api_winetbl_bridge
    view_label: "Wines"
    type: left_outer
    sql_on: ${order_orderproduct.wine_id} = ${api_winetbl.id} ;;
    relationship: many_to_one
  }
}

explore: retail_retailgroup_bridge {
  group_label: "Bridge"
  join: retail_retailstoregroupthrough_bridge {
    type: left_outer
    sql_on: ${retail_retailgroup_bridge.id} = ${retail_retailstoregroupthrough_bridge.group_id} ;;
    relationship: many_to_one
  }
  join: core_restaurant_bridge {
    type: left_outer
    sql_on: ${retail_retailstoregroupthrough_bridge.store_id} = ${core_restaurant_bridge.id} ;;
    relationship: many_to_one
  }

}

#
# explore: products_tipsi {
#   group_label: "Tipsi"
# }
#

explore: products_bridge {
  group_label: "Bridge"
}

explore: order_order_bridge {
  group_label: "Bridge"
}

explore: order_orderproduct_bridge {
  group_label: "Bridge"
}

explore: devices_bridge {
  from: notifications_fcmdevice_bridge
  group_label: "Bridge"
}
