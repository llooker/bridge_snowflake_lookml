include: "../../bridge/users.view"

view: users_drync_bridge {
  extends: [users_fields]
  derived_table: {
    explore_source: users_drync {
      column: id {}
      column: email {}
      column: first_name {}
      column: last_name {}
      column: birth_year {}
      derived_column: source {
        sql: 'drync' ;;
      }
      column: gender {field: users_drync.gender_for_ndt}
      column: age {}

    }
  }
}
