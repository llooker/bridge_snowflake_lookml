connection: "warehouse"

include: "iowa.view.lkml"

datagroup: iowa_default_datagroup {
  # sql_trigger: SELECT MAX(invoice_id) FROM iowa;;
  max_cache_age: "1 hour"
}

persist_with: iowa_default_datagroup

explore: iowa {
  view_name: iowa
  view_label: "Iowa Data Explore"
}
