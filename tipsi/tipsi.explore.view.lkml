include: "./views/*.view.lkml"
include: "./derived_views/*.view.lkml"

explore: products {
  from: retail_retailinventory
  group_label: "Tipsi"
  join: api_winetbl {
    type: left_outer
    sql_on: ${products.wine_id} = ${api_winetbl.id} ;;
    relationship: many_to_one
  }
  join: vendor_drink {
    type: left_outer
    sql_on: ${products.drink_id} = ${vendor_drink.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkproducer {
    type: left_outer
    sql_on: ${vendor_drink.producer_id} = ${vendor_drinkproducer.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinktag {
    type: left_outer
    sql_on: ${vendor_drink.tag_id} = ${vendor_drinktag.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkinventory {
    type: left_outer
    sql_on: ${vendor_drink.id} = ${vendor_drinkinventory.drink_id} ;;
    relationship: one_to_many
  }
}

explore: users_tipsi {
  from: tipsi_auth_user
  group_label: "Tipsi"
  join: order_order {
    view_label: "Orders"
    type: left_outer
    sql_on: ${users_tipsi.id} = ${order_order.user_id} ;;
    relationship: one_to_many
  }
  join: order_orderproduct {
    view_label: "Order Product"
    type: left_outer
    sql_on: ${order_order.id} = ${order_orderproduct.order_id} ;;
    relationship: many_to_one
  }
  join: vendor_drink {
    view_label: "Drinks"
    type: left_outer
    sql_on: ${order_orderproduct.drink_id} = ${vendor_drink.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkproducer {
    view_label: "Drink Producer"
    type: left_outer
    sql_on: ${vendor_drink.producer_id} = ${vendor_drinkproducer.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinktag {
    view_label: "Drink Tag"
    type: left_outer
    sql_on: ${vendor_drink.tag_id} = ${vendor_drinktag.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkinventory {
    view_label: "Drink Inventory"
    type: left_outer
    sql_on: ${vendor_drink.id} = ${vendor_drinkinventory.drink_id} ;;
    relationship: one_to_many
  }
  join: api_winetbl {
    view_label: "Wines"
    type: left_outer
    sql_on: ${order_orderproduct.wine_id} = ${api_winetbl.id} ;;
    relationship: many_to_one
  }
}

explore: orders_tipsi {
  from: order_order
  group_label: "Tipsi"
  #view_name: order_order
  join: retail_store {
    type: inner
    sql_on: ${orders_tipsi.store_id} = ${retail_store.restaurant_id} ;;
    relationship: many_to_one
  }
  join: core_restaurant {
    type: inner
    sql_on: ${retail_store.restaurant_id} = ${core_restaurant.id} ;;
    relationship: many_to_one
  }
  join: retail_retailstoregroupthrough {
    type: inner
    sql_on: ${core_restaurant.id} = ${retail_retailstoregroupthrough.store_id} ;;
    relationship: many_to_one
  }
  join: retail_retailgroup {
    type: inner
    sql_on: ${retail_retailstoregroupthrough.group_id} = ${retail_retailgroup.id} ;;
    relationship: many_to_one
  }
  join: users {
    from: tipsi_auth_user
    type: inner
    sql_on: ${users.id} = ${orders_tipsi.user_id} ;;
    relationship: many_to_one
  }
  join: order_orderproduct {
    view_label: "Order Product"
    type: left_outer
    sql_on: ${orders_tipsi.id} = ${order_orderproduct.order_id} ;;
    relationship: many_to_one
  }
  join: vendor_drink {
    view_label: "Drinks"
    type: left_outer
    sql_on: ${order_orderproduct.drink_id} = ${vendor_drink.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkproducer {
    view_label: "Drink Producer"
    type: left_outer
    sql_on: ${vendor_drink.producer_id} = ${vendor_drinkproducer.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinktag {
    view_label: "Drink Tag"
    type: left_outer
    sql_on: ${vendor_drink.tag_id} = ${vendor_drinktag.id} ;;
    relationship: many_to_one
  }
  join: vendor_drinkinventory {
    view_label: "Drink Inventory"
    type: left_outer
    sql_on: ${vendor_drink.id} = ${vendor_drinkinventory.drink_id} ;;
    relationship: one_to_many
  }
  join: api_winetbl {
    view_label: "Wines"
    type: left_outer
    sql_on: ${order_orderproduct.wine_id} = ${api_winetbl.id} ;;
    relationship: many_to_one
  }
}

explore: products_tipsi {
  group_label: "Tipsi"
}

explore: order_products_tipsi {
  from: order_orderproduct
  group_label: "Tipsi"
}
