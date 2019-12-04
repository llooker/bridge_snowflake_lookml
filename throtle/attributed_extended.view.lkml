view: attributes_extended {
  sql_table_name: marketing.public.attributes_extended ;;

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
  dimension: pets {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${TABLE}.pets = "1" ;;
      }
      else: "N/A"
    }
  }
  dimension: children {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${TABLE}.pets = "1" ;;
      }
      else: "N/A"
    }
  }
  dimension: occupation_raw {
    type:  number
    hidden: yes
    sql: ${TABLE}.occupation ;;
  }

  dimension: occupation {
    type: string
    case: {
      when: {
        label: "Accountant"
        sql: ${occupation_raw} = 1 ;;
      }
      when: {
        label: "Professional/Technical"
        sql: ${occupation_raw} = 2 ;;
      }
      when: {
        label: "Upper Management/Executive"
        sql: ${occupation_raw} = 3 ;;
      }
      when: {
        label: "Middle Management"
        sql: ${occupation_raw} = 4 ;;
      }
      when: {
        label: "Sales/marketing"
        sql: ${occupation_raw} = 5 ;;
      }
      when: {
        label: "Clerical Or Service Worker"
        sql: ${occupation_raw} = 6 ;;
      }
      when: {
        label: "Tradesman/machine/laborer"
        sql: ${occupation_raw} = 7 ;;
      }
      when: {
        label: "Retired"
        sql: ${occupation_raw} = 8 ;;
      }
      when: {
        label: "Student"
        sql: ${occupation_raw} = 9 ;;
      }
      when: {
        label: "Executive/administrator"
        sql: ${occupation_raw} = 10 ;;
      }
      when: {
        label: "Self Employed"
        sql: ${occupation_raw} = 11 ;;
      }
      when: {
        label: "Professional Driver"
        sql: ${occupation_raw} = 12 ;;
      }
      when: {
        label: "Military"
        sql: ${occupation_raw} = 13 ;;
      }
      when: {
        label: "Civil Servant"
        sql: ${occupation_raw} = 14 ;;
      }
      when: {
        label: "Farming/agriculture"
        sql: ${occupation_raw} = 15 ;;
      }
      when: {
        label: "Work From Home"
        sql: ${occupation_raw} = 16 ;;
      }
      when: {
        label: "Health Services"
        sql: ${occupation_raw} = 17 ;;
      }
      when: {
        label: "Financial Services"
        sql: ${occupation_raw} = 18 ;;
      }
      when: {
        label: "Business Owner"
        sql: ${occupation_raw} = 20 ;;
      }
      when: {
        label: "Teacher/educator"
        sql: ${occupation_raw} = 21 ;;
      }
      when: {
        label: "Retail Sales"
        sql: ${occupation_raw} = 22 ;;
      }
      when: {
        label: "Computer Professional"
        sql: ${occupation_raw} = 23 ;;
      }
      when: {
        label: "Beauty (Cosmetologist, Barber, Manicurist, Nails)"
        sql: ${occupation_raw} = 30 ;;
      }
      when: {
        label: "Real Estate (Sales, Brokers,  Appraisers)"
        sql: ${occupation_raw} = 31 ;;
      }
      when: {
        label: "Architect"
        sql: ${occupation_raw} = 32 ;;
      }
      when: {
        label: "Interior Designer"
        sql: ${occupation_raw} = 33 ;;
      }
      when: {
        label: "Landscape Architect"
        sql: ${occupation_raw} = 34 ;;
      }
      when: {
        label: "Electrician"
        sql: ${occupation_raw} = 35 ;;
      }
      when: {
        label: "Engineer"
        sql: ${occupation_raw} = 36 ;;
      }
      when: {
        label: "Accountant"
        sql: ${occupation_raw} = 37 ;;
      }
      when: {
        label: "Attorney"
        sql: ${occupation_raw} = 38 ;;
      }
      when: {
        label: "Social Worker"
        sql: ${occupation_raw} = 39 ;;
      }
      when: {
        label: "Counselor"
        sql: ${occupation_raw} = 40 ;;
      }
      when: {
        label: "Occupational Therapist/Physical Therapist"
        sql: ${occupation_raw} = 41 ;;
      }
      when: {
        label: "Speech Pathologist/Audiologist"
        sql: ${occupation_raw} = 42 ;;
      }
      when: {
        label: "Psychologist"
        sql: ${occupation_raw} = 43 ;;
      }
      when: {
        label: "Pharmacist"
        sql: ${occupation_raw} = 44 ;;
      }
      when: {
        label: "Optician/Optometrist"
        sql: ${occupation_raw} = 45 ;;
      }
      when: {
        label: "Veterinarian"
        sql: ${occupation_raw} = 46 ;;
      }
      when: {
        label: "Dentist/Dental Hygienist"
        sql: ${occupation_raw} = 47 ;;
      }
      when: {
        label: "Nurse"
        sql: ${occupation_raw} = 48 ;;
      }
      when: {
        label: "Doctor/Physician/Surgeon"
        sql: ${occupation_raw} = 49 ;;
      }
      when: {
        label: "Chiropractor"
        sql: ${occupation_raw} = 50 ;;
      }
      when: {
        label: "Surveyor"
        sql: ${occupation_raw} = 51 ;;
      }
      when: {
        label: "Disabled"
        sql: ${occupation_raw} = 52 ;;
      }
      else: "N/A"
    }
  }

  dimension: language {
    type: string
    case: {
      when: { label: "Arabic" sql: ${TABLE}.language = "A" ;; }
      when: { label: "Chinese" sql: ${TABLE}.language = "C" ;; }
      when: { label: "Pashtu" sql: ${TABLE}.language = "D" ;; }
      when: { label: "English" sql: ${TABLE}.language = "E" ;; }
      when: { label: "French" sql: ${TABLE}.language = "F" ;; }
      when: { label: "Greek" sql: ${TABLE}.language = "G" ;; }
      when: { label: "Hindu" sql: ${TABLE}.language = "H" ;; }
      when: { label: "Italian" sql: ${TABLE}.language = "I" ;; }
      when: { label: "Japanese" sql: ${TABLE}.language = "J" ;; }
      when: { label: "Korean" sql: ${TABLE}.language = "K" ;; }
      when: { label: "German" sql: ${TABLE}.language = "N" ;; }
      when: { label: "Polish" sql: ${TABLE}.language = "P" ;; }
      when: { label: "Russian" sql: ${TABLE}.language = "R" ;; }
      when: { label: "Spanish" sql: ${TABLE}.language = "S" ;; }
      when: { label: "Thai" sql: ${TABLE}.language = "T" ;; }
      when: { label: "Portuguese" sql: ${TABLE}.language = "U" ;; }
      when: { label: "Vietnamese" sql: ${TABLE}.language = "V" ;; }
      when: { label: "Hebrew" sql: ${TABLE}.language = "W" ;; }
      when: { label: "Persian" sql: ${TABLE}.language = "Z" ;; }
      else: "N/A"
    }
  }

  dimension: education {
    type: string
    case: {
      when: {
        label: "High School"
        sql: ${TABLE}.education_code = "1" ;;
      }
      when: {
        label: "Some College"
        sql: ${TABLE}.education_code = "2" ;;
      }
      when: {
        label: "Completed College"
        sql: ${TABLE}.education_code = "3" ;;
      }
      when: {
        label: "Graduated School"
        sql: ${TABLE}.education_code = "4" ;;
      }
      else: "N/A"
    }
  }

  dimension: internet_buyer {
    type: string
    case: {
      when: {
        label: "Purchased via Internet"
        sql: ${TABLE}.internet.buyer = "1" ;;
      }
      else: "N/A"
    }
  }

  dimension: wine_interest {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${TABLE}.hobby_wine_appreciation = "1" ;;
      }
      else: "N/A"
    }
  }

  dimension: cooking_gourmet {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${TABLE}.hobby_cooking_gourmet = "1" ;;
      }
      else: "N/A"
    }
  }

  dimension: casino_gambling {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${TABLE}.casino_gambling ;;
      }
      else: "N/A"
    }
  }

  dimension: reads_cooking_books {
    type: string
    case: {
      when: {
        label: "Yes"
        sql: ${TABLE}.reading_cooking_or_culinary ;;
      }
      else: "N/A"
    }
  }
}
