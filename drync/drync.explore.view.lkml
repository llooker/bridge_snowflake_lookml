include: "*.view.lkml"

explore: product_clicked_drync {
  from:  product_clicked
  group_label: "Drync"
  join: products_drync {
    type: inner
    relationship: many_to_one
    sql_on: ${product_clicked_drync.product_id} = ${products_drync.id} ;;
  }

  join: fulfillers {
    type: inner
    sql_on: ${product_clicked_drync.retailer_id} = ${fulfillers.short_name};; #retailer_id is not an int, would not match on fufiller.id WFD 10-7-2019
    relationship: many_to_one
  }

  join: organizations {
    from: organizations_drync
    type: inner
    sql_on: ${fulfillers.organization_id}=${organizations.id} ;;
    relationship: many_to_one
  }

  join: users_drync {
    type: inner
    sql_on: ${product_clicked_drync.user_id} = ${users_drync.id} ;;
    relationship: many_to_one
  }

  join: devices {
    from: devices_drync
    type: inner
    sql_on: ${users_drync.id} = ${devices.id} ;;
    relationship: many_to_one
  }

  join: orders {
    from: orders_drync
    type: inner
    sql_on: ${users_drync.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }
}

explore: users_drync {
  group_label: "Drync"
  join: app_registrations {
    type: inner
    sql_on: ${app_registrations.user_id} = ${users_drync.id} ;;
    relationship: one_to_many
  }

  join: apps {
    type: inner
    sql_on: ${app_registrations.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }

  join: app_sessions {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${apps.id} = ${app_sessions.app_id} AND ${app_sessions.user_id} = ${users_drync.id} ;;

  }
  join: devices {
    from: devices_drync
    type: inner
    sql_on: ${users_drync.id} = ${devices.user_id} ;;
    relationship: many_to_one
  }
  join: orders {
    from: orders_drync
    type: left_outer
    sql_on: ${users_drync.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }

  join: shipments {
    type: left_outer
    sql_on: ${orders.id} = ${shipments.order_id} ;;
    relationship: one_to_many
  }

  join: line_items {
    type: left_outer
    sql_on: ${shipments.id} = ${line_items.shipment_id} ;;
    relationship: many_to_one
  }

  join: fulfillers {
    type: inner
    sql_on: ${orders.shopping_fulfiller_id} = ${fulfillers.id};;
    relationship: many_to_one
  }

  join: product_clicked {
    type: inner
    sql_on: ${product_clicked.user_id} = ${users_drync.id} ;;
    relationship: many_to_one
  }

  join: products_drync {
    type: inner
    sql_on: ${product_clicked.product_id} = ${products_drync.id} ;;
    relationship: many_to_one
  }
}


explore: orders_drync {
  group_label: "Drync"
}

explore: products_drync {
  group_label: "Drync"
}

explore: devices_drync {
  group_label: "Drync"
}

explore: line_items {
  group_label: "Drync"
  join: shipments {
    type: left_outer
    sql_on: ${line_items.shipment_id} = ${shipments.id} ;;
    relationship: many_to_one
  }
  join: orders {
    from: orders_drync
    type: left_outer
    sql_on: ${shipments.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }

  join: order_percentage {
    type: inner
    sql_on: ${orders.id} = ${order_percentage.order_id} ;;
    relationship: many_to_one
  }

  join: users_drync {
    view_label: "Users"
    type: left_outer
    sql_on: ${orders.user_id} = ${users_drync.id} ;;
    relationship: many_to_one
  }
  join: app_registrations {
    type: inner
    sql_on: ${app_registrations.user_id} = ${users_drync.id} ;;
    relationship: one_to_many
  }

  join: apps {
    type: inner
    sql_on: ${app_registrations.app_id} = ${apps.id} ;;
    relationship: many_to_one
  }

  join: app_sessions {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${apps.id} = ${app_sessions.app_id} AND ${app_sessions.user_id} = ${users_drync.id} ;;

  }

  join: devices {
    from: devices_drync
    type: inner
    sql_on: ${users_drync.id} = ${devices.user_id} ;;
    relationship: many_to_one
  }

  join: fulfillers {
    type: inner
    sql_on: ${orders.shopping_fulfiller_id} = ${fulfillers.id};;
    relationship: many_to_one
  }

  join: organizations {
    from: organizations_drync
    type: inner
    sql_on: ${fulfillers.organization_id}=${organizations.id} ;;
    relationship: many_to_one
  }

  join: products_drync {
    type: inner
    sql_on: ${line_items.bottle_id} = ${products_drync.id} ;;
    relationship: many_to_one
  }

  join: retailer_bottle_sources {
    type: left_outer
    sql_on: ${retailer_bottle_sources.id} = ${line_items.retailer_bottle_source_id} ;;
    relationship: one_to_many

  }
}

explore: order_items_base_drync {}
