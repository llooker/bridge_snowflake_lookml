include: "../drync/drync_bridge/users.view.lkml"
include: "../tipsi/tipsi_bridge/users.view.lkml"




view: users {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:  SELECT * FROM ${users_drync_bridge.SQL_TABLE_NAME}
            UNION
          SELECT * FROM ${users_tipsi_bridge.SQL_TABLE_NAME}
          --left join genderize
      ;;
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
  dimension: gender {
#     sql: coalesce(${TABLE}.gender,genderize.gender) ;;
  }
}
