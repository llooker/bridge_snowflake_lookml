view: users_drync {
  sql_table_name: production.production.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type:  string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: birth_year {
    type:  number
    sql: ${TABLE}.birth_year ;;
  }

  dimension: age {
    type: number
    sql: extract(year from current_date) - ${birth_year} ;;
  }

  dimension: gender_for_ndt {
    hidden: yes
    sql: ${gender} ;;
  }

  dimension: gender {
    type: string
    case: {
      when: {
        label: "Male"
        sql: ${TABLE}.gender = 'm' ;;
      }
      when: {
        label: "Female"
        sql: ${TABLE}.gender = 'f' ;;
      }
      else: "N/A"
    }
  }

  dimension: generation {
    type:  string
    case: {
      when: {
        label: "Mature"
        sql: ${birth_year} < 1946;;
      }
      when: {
        label: "Baby Boomer"
        sql: ${birth_year} >= 1946 AND ${birth_year} <= 1964;;
      }
      when: {
        label: "Generation X"
        sql: ${birth_year} > 1964 AND ${birth_year} <= 1980;;
      }
      when: {
        label: "Millennial"
        sql: ${birth_year} > 1980 AND ${birth_year} <= 2000;;
      }
      else: "Undefined"
    }
  }

  measure: count {
    type: count
    drill_fields: [email, last_name, birth_year, age, generation, products.brand, products.name, products.category, products.subcategory]
  }

  measure: count_distinct {
    type: count_distinct
    sql_distinct_key: ${id} ;;
    sql: ${id} ;;
    drill_fields: [email, last_name, birth_year, age, generation, products.brand, products.name, products.category, products.subcategory]
  }

  measure: percentage {
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [email, last_name, birth_year, age, generation, products.brand, products.name, products.category, products.subcategory]
  }
}
