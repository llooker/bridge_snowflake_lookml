connection: "warehouse2"

include: "*.view.lkml"

explore: product_clicked {
  join: products {
    type: inner
    relationship: many_to_one
    sql_on: ${product_clicked.product_id} = ${products.id} ;;
  }

  join: fulfillers {
    type: inner
    sql_on: ${product_clicked.retailer_id} = ${fulfillers.short_name};; #retailer_id is not an int, would not match on fufiller.id WFD 10-7-2019
    relationship: many_to_one
  }

  join: organizations {
    type: inner
    sql_on: ${fulfillers.organization_id}=${organizations.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: inner
    sql_on: ${product_clicked.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: inner
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }
}

explore: users {
  join: orders {
    type: left_outer
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }

  join: fulfillers {
    type: inner
    sql_on: ${orders.shopping_fulfiller_id} = ${fulfillers.id};;
    relationship: many_to_one
  }

  join: product_clicked {
    type: inner
    sql_on: ${product_clicked.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: inner
    sql_on: ${product_clicked.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}


explore: orders {

}
