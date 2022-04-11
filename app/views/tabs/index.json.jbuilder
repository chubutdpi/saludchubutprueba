json.set! :data do
  json.array! @tabs do |tab|
    json.partial! 'tabs/tab', tab: tab
    json.url  "
              #{link_to 'Show', tab }
              #{link_to 'Edit', edit_tab_path(tab)}
              #{link_to 'Destroy', tab, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end