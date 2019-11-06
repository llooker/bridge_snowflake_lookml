view: attributes {
  sql_table_name: marketing.public.attributes ;;

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: throtle_id {
    type: number
    sql: ${TABLE}.throtle_id::int ;;
  }

  dimension: birth_year {
    type: number
    sql: LEFT(${TABLE}.dob, 4)::int ;;
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

  dimension: birth_month {
    type: number
    sql: RIGHT(${TABLE}.dob, 2)::int ;;
  }

  dimension: gender_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.gender ;;
  }

  dimension: gender {
    type: string
    case: {
      when: {
        label: "Male"
        sql: ${gender_raw} = 'M' ;;
      }
      when: {
        label: "Female"
        sql: ${gender_raw} = 'S' ;;
      }
      else: "N/A"
    }
  }

  dimension: homeowner_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.home_owner ;;
  }

  dimension: homeowner {
    type: string
    case: {
      when: {
        label: "Home Owner"
        sql: ${homeowner_raw} = 'Y' ;;
      }
      when: {
        label: "Renter"
        sql: ${homeowner_raw} = 'R' ;;
      }
      when: {
        label: "Probable Renter"
        sql: ${homeowner_raw} = 'P' ;;
      }
      when: {
        label: "Probable Home Owner"
        sql: ${homeowner_raw} = 'W' ;;
      }
      else: "N/A"
    }
  }

  dimension: income_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.income ;;
  }

  dimension: income {
    type: string
    case: {
      when: {
        label: "< $10K"
        sql: ${income_raw} = 'A' ;;
      }
      when: {
        label: "$10,000 - $19,999"
        sql: ${income_raw} = 'B' ;;
      }
      when: {
        label: "$20 - $29,999"
        sql: ${income_raw} = 'C' ;;
      }
      when: {
        label: "$30 - $39,999"
        sql: ${income_raw} = 'D' ;;
      }
      when: {
        label: "$40 - $49,999"
        sql: ${income_raw} = 'E' ;;
      }
      when: {
        label: "$50 - $59,999"
        sql: ${income_raw} = 'F' ;;
      }
      when: {
        label: "$60 - $69,999"
        sql: ${income_raw} = 'G' ;;
      }
      when: {
        label: "$70 - $79,999"
        sql: ${income_raw} = 'H' ;;
      }
      when: {
        label: "$80 - $89,999"
        sql: ${income_raw} = 'I' ;;
      }
      when: {
        label: "$90 - $99,999"
        sql: ${income_raw} = 'J' ;;
      }
      when: {
        label: "$100 - $149,999"
        sql: ${income_raw} = 'K' ;;
      }
      when: {
        label: "$150 - $174,999"
        sql: ${income_raw} = 'L' ;;
      }
      when: {
        label: "$175 - $199,999"
        sql: ${income_raw} = 'M' ;;
      }
      when: {
        label: "$200 - $249,999"
        sql: ${income_raw} = 'N' ;;
      }
      when: {
        label: "$250K+"
        sql: ${income_raw} = 'O' ;;
      }
      else: "N/A"
    }
  }

  dimension: marital_status_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.marital_status ;;
  }

  dimension: marital_status {
    type: string
    case: {
      when: {
        label: "Married"
        sql: ${marital_status_raw} = 'M' ;;
      }
      when: {
        label: "Single"
        sql: ${marital_status_raw} = 'S' ;;
      }
      else: "N/A"
    }
  }

  dimension: sports_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.sports ;;
  }

  dimension: sports {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${sports_raw} = '1' ;;
      }
      else: "No"
    }
  }

  dimension: travel_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.travel ;;
  }

  dimension: travel {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${travel_raw} = '1' ;;
      }
      else: "No"
    }
  }

  dimension: valuehunter_raw {
    type: string
    hidden: yes
    sql: ${TABLE}.valuehunter ;;
  }

  dimension: value_hunter {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${valuehunter_raw} = 'Y' ;;
      }
      else: "No"
    }
  }
}
