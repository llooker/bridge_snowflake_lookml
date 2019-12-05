datagroup: bridge_default {
  sql_trigger: select count(*) from ${order_product.SQL_TABLE_NAME} ;;
  max_cache_age: "720 hours"
}

persist_with: bridge_default
