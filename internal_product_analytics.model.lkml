include: "products.view.lkml"
include: "product_clicked.view.lkml"
include: "product_retailers.view.lkml"
include: "users.view.lkml"

connection: "warehouse"

explore: products {
  join: product_clicked {
    type: inner
    relationship: one_to_many
    sql_on: ${product_clicked.product_id} = ${products.id} ;;
  }

  join: product_retailers {
    view_label: "Retailers"
    type: inner
    relationship: many_to_many
    sql_on: ${product_retailers.id} = ${product_clicked.retailer_id};;
  }

  join: users {
    view_label: "Users"
    type: inner
    relationship: many_to_many
    sql_on: ${product_clicked.user_id} = ${users.id};;
  }
}
