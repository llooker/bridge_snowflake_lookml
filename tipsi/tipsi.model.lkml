connection: "warehouse_tipsi"

include: "./views/*.view.lkml"

explore: products {
  from: retail_retailinventory
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
