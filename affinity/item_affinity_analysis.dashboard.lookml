- dashboard: item_affinity_analysis
  title: Item Affinity Analysis
  layout: newspaper
  elements:
  - title: Product Segmentation
    name: Product Segmentation
    model: united
    explore: order_purchase_affinity
    type: looker_scatter
    fields: [order_purchase_affinity.product_a_average_rest_of_basket_margin, order_purchase_affinity.product_a_order_frequency,
      order_purchase_affinity.product_a_order_count, order_purchase_affinity.product_a]
    filters: {}
    sorts: [order_purchase_affinity.product_a_order_count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: step
    hidden_fields: [order_purchase_affinity.product_a, order_purchase_affinity.product_a_order_frequency]
    listen:
      Product Level: order_items_base.product_level
      Analysis Timeframe: order_purchase_affinity.affinity_timeframe
      Minimum Purchase Frequency: order_purchase_affinity.product_a_order_frequency
    row: 2
    col: 12
    width: 12
    height: 8
  - title: What are my most popular and margin-generating items?
    name: What are my most popular and margin-generating items?

    explore: order_purchase_affinity
    type: table
    fields: [order_purchase_affinity.product_a, order_purchase_affinity.product_a_image, order_purchase_affinity.product_a_average_rest_of_basket_margin,
      order_purchase_affinity.product_a_order_frequency, order_purchase_affinity.product_a_order_count,
      order_purchase_affinity.product_a_percent_purchased_by_loyalty_customer]
    filters: {}
    sorts: [order_purchase_affinity.product_a_order_count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85,
          custom: {id: 0beedf53-60ed-7e3d-6b1e-9800cfe27788, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#83ff80", offset: 50},
              {color: "#06bf23", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [order_purchase_affinity.product_a_average_rest_of_basket_margin]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: step
    hidden_fields:
    listen:
      Product Level: order_items_base.product_level
      Analysis Timeframe: order_purchase_affinity.affinity_timeframe
      Minimum Purchase Frequency: order_purchase_affinity.product_a_order_frequency
    row: 2
    col: 0
    width: 12
    height: 8
  - title: Proposed Attachments
    name: Proposed Attachments

    explore: order_purchase_affinity
    type: looker_scatter
    fields: [order_purchase_affinity.product_b, order_purchase_affinity.product_b_average_rest_of_basket_margin,
      order_purchase_affinity.lift, order_purchase_affinity.product_b_order_frequency]
    filters: {}
    sorts: [order_purchase_affinity.lift desc]
    limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85,
          custom: {id: 0beedf53-60ed-7e3d-6b1e-9800cfe27788, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#83ff80", offset: 50},
              {color: "#06bf23", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: step
    hidden_fields: [order_purchase_affinity.product_b]
    listen:
      Product Level: order_items_base.product_level
      Analysis Timeframe: order_purchase_affinity.affinity_timeframe
      Focus Product: order_purchase_affinity.product_a
      Minimum Purchase Frequency: order_purchase_affinity.product_b_order_frequency
    row: 15
    col: 10
    width: 14
    height: 12
  - title: What items go well with the focus product and drive the biggest combined
      check?
    name: What items go well with the focus product and drive the biggest combined
      check?

    explore: order_purchase_affinity
    type: table
    fields: [order_purchase_affinity.product_b,order_purchase_affinity.product_b_image, order_purchase_affinity.product_b_average_rest_of_basket_margin,
      order_purchase_affinity.lift, order_purchase_affinity.product_b_order_frequency]
    filters: {}
    sorts: [order_purchase_affinity.lift desc]
    limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85,
          custom: {id: 0beedf53-60ed-7e3d-6b1e-9800cfe27788, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#83ff80", offset: 50},
              {color: "#06bf23", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [order_purchase_affinity.lift]},
      {type: along a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85, custom: {
            id: 42c42989-a24b-cae4-b890-84b06c7d20ed, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#83ff80", offset: 50},
              {color: "#06bf23", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: [order_purchase_affinity.product_b_average_rest_of_basket_margin]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: step
    hidden_fields:
    listen:
      Product Level: order_items_base.product_level
      Analysis Timeframe: order_purchase_affinity.affinity_timeframe
      Focus Product: order_purchase_affinity.product_a
      Minimum Purchase Frequency: order_purchase_affinity.product_b_order_frequency
    row: 17
    col: 0
    width: 10
    height: 10
  - title: Focus Product
    name: Focus Product

    explore: order_purchase_affinity
    type: single_value
    fields: [order_purchase_affinity.product_a]
    filters:
      order_purchase_affinity.product_b_order_frequency: ">=0.005"
    sorts: [order_purchase_affinity.product_a]
    limit: 50
    dynamic_fields: [{table_calculation: focus_product, label: Focus Product, expression: 'if(count(${order_purchase_affinity.product_a})=1,${order_purchase_affinity.product_a},null)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85,
          custom: {id: 0beedf53-60ed-7e3d-6b1e-9800cfe27788, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#83ff80", offset: 50},
              {color: "#06bf23", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: along a scale...,
        value: !!null '', background_color: !!null '', font_color: !!null '', color_application: {
          collection_id: d588263f-f0cb-4f93-b431-700d57025b85, custom: {id: 42c42989-a24b-cae4-b890-84b06c7d20ed,
            label: Custom, type: continuous, stops: [{color: "#ffffff", offset: 0},
              {color: "#83ff80", offset: 50}, {color: "#06bf23", offset: 100}]}, options: {
            steps: 5}}, bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: step
    hidden_fields: [order_purchase_affinity.product_a]
    listen:
      Product Level: order_items_base.product_level
      Analysis Timeframe: order_purchase_affinity.affinity_timeframe
      Focus Product: order_purchase_affinity.product_a
      Minimum Purchase Frequency: order_purchase_affinity.product_a_order_frequency
    row: 15
    col: 0
    width: 10
    height: 2
  - name: Product Segmentation Tile
    type: text
    title_text: Product Segmentation
    row: 0
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: What are the best products to bundle with the focus product?
    row: 10
    col: 0
    width: 24
    height: 2
  - name: 'Text tile 1'
    type: text
    subtitle_text: Finally, what are my least popular items in that timeframe?
    body_text: ''
    row: 27
    col: 0
    width: 24
    height: 2
  - title: Product Rationalisation
    name: Product Rationalisation

    explore: order_purchase_affinity
    type: table
    fields: [order_purchase_affinity.product_a, order_purchase_affinity.product_a_image, order_purchase_affinity.product_a_order_frequency,
      order_purchase_affinity.product_a_average_basket_margin, order_purchase_affinity.product_a_percent_purchased_by_loyalty_customer,
      order_purchase_affinity.product_a_percent_customer_exclusivity]
    filters: {}
    sorts: [order_purchase_affinity.product_a_order_frequency]
    limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85,
          custom: {id: e957ced6-3159-da29-15b3-b19b2036f209, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#bf402c", offset: 100}]},
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: [order_purchase_affinity.product_a_order_frequency]}, {type: along
          a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85, custom: {
            id: 62da82c5-db03-598f-d9d2-24c05cea68bc, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#bf402c", offset: 100}]},
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: [order_purchase_affinity.product_a_average_basket_margin]}, {type: along
          a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85, custom: {
            id: 33756f45-fbc4-92e6-96c6-32bc11615cf8, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#bf402c", offset: 100}]},
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: [order_purchase_affinity.product_a_percent_purchased_by_loyalty_customer]},
      {type: along a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: d588263f-f0cb-4f93-b431-700d57025b85, custom: {
            id: 721b90d4-be82-368f-b843-70e922627449, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#bf402c", offset: 100}]},
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: [order_purchase_affinity.product_a_percent_customer_exclusivity]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
    series_types: {}
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: step
    hidden_fields:
    listen:
      Product Level: order_items_base.product_level
      Analysis Timeframe: order_purchase_affinity.affinity_timeframe
      Minimum Purchase Frequency: order_purchase_affinity.product_a_order_frequency
    row: 29
    col: 0
    width: 24
    height: 11
  filters:
  - name: Product Level
    title: Product Level
    type: field_filter
    default_value: prod^_name
    allow_multiple_values: true
    required: false
    model: united
    explore: order_purchase_affinity
    listens_to_filters: []
    field: order_items_base.product_level

  - name: Analysis Timeframe
    title: Analysis Timeframe
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false

  - name: Focus Product
    title: Focus Product
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false

    explore: order_purchase_affinity
    listens_to_filters: []
    field: order_purchase_affinity.product_a
  - name: Minimum Purchase Frequency
    title: Minimum Purchase Frequency
    type: number_filter
    default_value: ">=0.005"
    allow_multiple_values: true
    required: false
