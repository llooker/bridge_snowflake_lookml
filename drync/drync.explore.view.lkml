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
    type: inner
    sql_on: ${fulfillers.organization_id}=${organizations.id} ;;
    relationship: many_to_one
  }

  join: users_drync {
    type: inner
    sql_on: ${product_clicked_drync.user_id} = ${users_drync.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: inner
    sql_on: ${users_drync.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }
}

explore: users_drync {
  group_label: "Drync"
  join: orders {
    type: left_outer
    sql_on: ${users_drync.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }

  join: shipments {
    type: left_outer
    sql_on: ${orders.id} = ${shipments.order_id} ;;
    relationship: one_to_many
  }

  join: order_products {
    type: left_outer
    sql_on: ${shipments.id} = ${order_products.shipment_id} ;;
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
  from:  orders
  group_label: "Drync"
}

explore: products_drync {
  group_label: "Drync"
}

explore: line_items {
  group_label: "Drync"
  join: shipments {
    type: left_outer
    sql_on: ${line_items.shipment_id} = ${shipments.id} ;;
    relationship: many_to_one
  }
}
