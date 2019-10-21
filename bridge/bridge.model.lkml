connection: "warehouse2"

include: "*.view.lkml"
include: "../tipsi/tipsi.explore.view"
include: "../drync/drync.explore.view"

explore: users {

}

explore: products_bridge {
  label: "Products"
}

explore: orders_bridge {
  label: "Orders"
}
