- dashboard: test_lana
  title: Test Lana
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
  - name: add_a_unique_name_1654631525
    title: Untitled Visualization
    model: looker_intensive_8_svitlana_severyna_module_2
    explore: f_lineitems
    type: table
    fields: [f_lineitems.count, f_lineitems.l_shipmode]
    sorts: [f_lineitems.count desc]
    limit: 500
