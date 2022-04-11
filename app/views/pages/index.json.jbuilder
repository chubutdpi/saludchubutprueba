json.set! :data do
  json.array! @pages do |page|
    json.partial! 'pages/page', page: page
    json.url  "
              #{link_to 'Show', page }
              #{link_to 'Edit', edit_page_path(page)}
              #{link_to 'Destroy', page, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end