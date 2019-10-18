view: users_drync_bridge {
  derived_table: {
    explore_source: users_drync {
      column: id {}
      column: email {}
      column: first_name {}
      column: last_name {}
      column: birth_year {}
      column: gender {field: users_drync.gender_for_ndt}
      derived_column: source {
        sql: 'drync' ;;
      }

    }
  }
  dimension: id {
    type: number
  }
  dimension: email {}
  dimension: first_name {}
  dimension: last_name {}
  dimension: birth_year {
    type: number
  }
  dimension: source {
    type: string
  }
  dimension: gender {}
}
