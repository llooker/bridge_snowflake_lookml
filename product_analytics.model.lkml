connection: "warehouse"

include: "*.view.lkml"

explore: products {
  join: product_clicked {
    type: inner
    relationship: one_to_many
    sql_on: ${product_clicked.product_id} = ${products.id} ;;
  }

  join: fulfillers {
    type: inner
    sql_on: ${product_clicked.retailer_id} = ${fulfillers.id};;
    relationship: many_to_one
  }

  join: organizations {
    type: inner
    sql_on: ${fulfillers.organization_id}=${organizations.id} ;;
    relationship: many_to_one
  }

}
