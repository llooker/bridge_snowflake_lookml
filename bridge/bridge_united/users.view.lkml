include: "../../united/users.view"

view: users_bridge_united {
  extends: [users_fields]
  derived_table: {
    explore_source: users_bridge {
      column: id {}
      column: email {}
      column: first_name {}
      column: last_name {}
      column: birth_year { field: users_bridge.birth_year_number }
      column: gender {}
      column: age {}
      derived_column: state {
        sql: null ;;
      }
      derived_column: zipcode {
        sql: null ;;
      }
      derived_column: country {
        sql: null ;;
      }
      derived_column: source {
        sql: 'bridge' ;;
      }
    }
  }
}
