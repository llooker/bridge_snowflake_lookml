datagroup: bridge_default {
  sql_trigger: select count(*) from production.production.line_items ;;
  max_cache_age: "720 hours"
}

persist_with: bridge_default
