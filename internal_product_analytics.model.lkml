include: "products.view.lkml"
include: "product_clicked.view.lkml"
include: "product_retailers.view.lkml"

connection: "warehouse"

view: users {
  sql_table_name: production.production.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type:  string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

}

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
