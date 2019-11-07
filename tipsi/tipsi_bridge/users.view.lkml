include: "../../bridge/users.view"

view: users_tipsi_bridge {
  extends: [users_fields]
  derived_table: {
    explore_source: users_tipsi {
      column: id {}
      column: email {}
      column: first_name {}
      column: last_name {}
      column: birth_year { field: users_tipsi.birth_year_number }
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
        sql: 'tipsi' ;;
      }
    }
  }
}
