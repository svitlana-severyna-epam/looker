- dashboard: test_lana
  title: test_lana
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - name: firs
  title: Untitled Visualization
  model: looker_intensive_8_svitlana_severyna_module_2
  explore: f_lineitems
  type: table
  fields: [f_lineitems.count, f_lineitems.l_shipmode]
  sorts: [f_lineitems.count desc]
  limit: 500
